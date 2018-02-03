{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE LambdaCase            #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RecordWildCards       #-}
{-# LANGUAGE StandaloneDeriving    #-}

-- | Shared type representing datasources and resources.
--
-- FIXME: come up with a better name - maybe 'Schema'?
module Terrafomo.Source
    ( Dependency (..)

    , Present (..)
    , Source (..)

    , DataSource
    , newDataSource

    , Resource
    , newResource

    , provider
    , configuration
    , dependencies
    , dependOn
    ) where

import Data.List.NonEmpty (NonEmpty)
import Data.Maybe         (catMaybes)
import Data.Set           (Set)
import Data.Text          (Text)
import Data.Void          (Void)

import Lens.Micro (Lens, Lens', lens)

import Terrafomo.Lifecycle
import Terrafomo.Name

import qualified Data.Set      as Set
import qualified Lens.Micro    as Lens
import qualified Terrafomo.HCL as HCL

-- Dependencies

newtype Dependency = Dependency Key
   deriving (Show, Eq, Ord)

instance HCL.ToHCL Dependency where
    toHCL (Dependency k) = HCL.toHCL k

-- Present (Type-level Maybe)

data Present a where
    Present :: !a -> Present a
    Absent  ::       Present Void

deriving instance Show a => Show (Present a)
deriving instance Eq   a => Eq   (Present a)

-- Source Types

instance HasLifecycle (Present (Lifecycle a)) a where
    lifecycle =
        lens (\(Present x) -> x) (\(Present _) x -> Present x)

data Source l p a = Source
    { _sourceProvider  :: !(Maybe p)
    , _sourceLifecycle :: !(Present l)
    , _sourceDependsOn :: !(Set Dependency)
    , _sourceType      :: !Type
    , _sourceConfig    :: !a
    } deriving (Show, Eq)

type DataSource p a = Source Void          p a
type Resource   p a = Source (Lifecycle a) p a

instance HasLifecycle (Resource p a) a where
    lifecycle =
          lens _sourceLifecycle (\s a -> s { _sourceLifecycle = a })
              . lifecycle

instance HCL.ToHCL a => HCL.ToHCL (Key, DataSource Key a) where
    toHCL (k, v) =
        sourceHCL (HCL.key "data" k) v Nothing

instance HCL.ToHCL a => HCL.ToHCL (Key, Resource Key a) where
    toHCL (k, v) =
        sourceHCL (HCL.key "resource" k) v $
            case _sourceLifecycle v of
                Present x | x == mempty -> Nothing
                          | otherwise   -> Just x

sourceHCL
    :: HCL.ToHCL a
    => NonEmpty HCL.Id
    -> Source l Key a
    -> Maybe (Lifecycle a)
    -> HCL.Value
sourceHCL key Source{..} lcycle =
   HCL.object key $ catMaybes
        [ HCL.assign "provider" <$> _sourceProvider
        , Just (HCL.toHCL _sourceConfig)
        , HCL.assign "lifecycle" <$> lcycle
        , if _sourceDependsOn == mempty
              then Nothing
              else Just (HCL.assign "depends_on" (HCL.list _sourceDependsOn))
        ]

newDataSource :: Text -> a -> DataSource p a
newDataSource name cfg =
    Source { _sourceProvider  = Nothing
           , _sourceLifecycle = Absent
           , _sourceDependsOn = mempty
           , _sourceType      = Type (Just "data") name
           , _sourceConfig    = cfg
           }

newResource :: Text -> a -> Resource p a
newResource name cfg =
    Source { _sourceProvider  = Nothing
           , _sourceLifecycle = Present mempty
           , _sourceDependsOn = mempty
           , _sourceType      = Type Nothing name
           , _sourceConfig    = cfg
           }

-- Lenses

-- | The specific provider configuration to use for this resource or
-- datasource. If none is specified an inferred default will be used.
provider :: Lens (Source l p a) (Source l p' a) (Maybe p) (Maybe p')
provider = lens _sourceProvider (\s a -> s { _sourceProvider = a })

-- | The underlying type/data config representing the specific resource or
-- datasource configuration.
configuration :: Lens' (Source l p a) a
configuration = lens _sourceConfig (\s a -> s { _sourceConfig = a })

-- | Explicit dependencies that this resource or datasource has. These
-- dependencies will be created _before_.
dependencies :: Lens' (Source l p a) (Set Dependency)
dependencies = lens _sourceDependsOn (\s a -> s { _sourceDependsOn = a })

-- | Helper for explicitly depending upon a reference.
dependOn
    :: Reference s a
    -> Source l p b
    -> Source l p b
dependOn x =
    Lens.over dependencies $
        Set.insert (Dependency (referenceKey x))