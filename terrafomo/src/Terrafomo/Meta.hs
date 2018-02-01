{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE LambdaCase             #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RecordWildCards        #-}

module Terrafomo.Meta
    ( HasMeta      (..)
    , Dependency   (..)

    , Changes
    , getChanges
    , wildcardChange
    , attributeChange

    , HasLifecycle (..)
    , Lifecycle    (..)
    )where

import Data.Function  (on)
import Data.Semigroup (Semigroup ((<>)))
import Data.Set       (Set)

import GHC.TypeLits (KnownSymbol)

import Lens.Micro (ASetter', Lens, Lens', lens)

import Terrafomo.Attribute (Attribute, attributeName)
import Terrafomo.Name

import qualified Data.Set      as Set
import qualified Terrafomo.HCL as HCL

-- Meta Parameters (shared between Resource + DataSources)

class HasMeta b where
    -- | The specific provider configuration to use for this resource or
    -- datasource. If none is specified an inferred default will be used.
    provider :: Lens (b p a) (b p' a) (Maybe p) (Maybe p')

    -- | The underlying type/data config representing the specific resource or
    -- datasource configuration.
    configuration :: Lens' (b p a) a

    -- | Explicit dependencies that this resource or datasource has. These
    -- dependencies will be created _before_.
    dependsOn :: Lens' (b p a) (Set Dependency)

-- Dependencies

newtype Dependency = Dependency Key
   deriving (Show, Eq, Ord)

instance HCL.ToHCL Dependency where
    toHCL (Dependency k) = HCL.toHCL k

-- Attribute Changes

-- | Ignored attribute names can be matched by their name, not state ID. For
-- example, if an aws_route_table has two routes defined and the ignore_changes
-- list contains "route", both routes will be ignored. Additionally you can
-- also use a single entry with a wildcard (e.g. "*") which will match all
-- attribute names. Using a partial string together with a wildcard
-- (e.g. "rout*") is not supported.
data Changes a
    = Wildcard -- '*'
    | Match !(Set Name)
      deriving (Show, Eq, Ord)

instance Semigroup (Changes a) where
    (<>) a b =
        case (a, b) of
            (Wildcard, _)        -> Wildcard
            (_,        Wildcard) -> Wildcard
            (Match xs, Match ys) -> Match (xs <> ys)

instance Monoid (Changes a) where
    mempty  = Match mempty
    mappend = (<>)

instance HCL.ToHCL (Changes a) where
    toHCL x =
        case getChanges x of
            Nothing -> HCL.list [HCL.string "*"]
            Just ns -> HCL.list ns

getChanges :: Changes a -> Maybe (Set Name)
getChanges = \case
    Wildcard -> Nothing
    Match xs -> Just xs

wildcardChange :: Changes a -> Changes a
wildcardChange = const Wildcard

attributeChange :: KnownSymbol n => Attribute s n a -> Changes a -> Changes a
attributeChange x xs = Match (Set.singleton (attributeName x)) <> xs

-- Lifecycle

-- | Resources have a strict lifecycle, and can be thought of as basic state
-- machines. Understanding this lifecycle can help better understand how Terraform
-- generates an execution plan, how it safely executes that plan, and what the
-- resource provider is doing throughout all of this.
data Lifecycle a = Lifecycle
    { _preventDestroy      :: !Bool
    , _createBeforeDestroy :: !Bool
    , _ignoreChanges       :: !(Changes a)
    } deriving (Show, Eq)

instance Semigroup (Lifecycle a) where
    (<>) a b = Lifecycle
        { _preventDestroy      = on (||) _preventDestroy      a b
        , _createBeforeDestroy = on (||) _createBeforeDestroy a b
        , _ignoreChanges       = on (<>) _ignoreChanges       a b
        }

instance Monoid (Lifecycle a) where
    mempty  = Lifecycle False False mempty
    mappend = (<>)

class HasLifecycle a b | a -> b where
    lifecycle :: Lens' a (Lifecycle b)

    -- | This flag provides extra protection against the destruction of a given
    -- resource. When this is set to true, any plan that includes a destroy of
    -- this resource will return an error message.
    preventDestroy :: Lens' a Bool
    preventDestroy =
        lifecycle .
            lens _preventDestroy
                (\s a -> s { _preventDestroy = a })

    -- | This flag is used to ensure the replacement of a resource is created
    -- before the original instance is destroyed. As an example, this can be used
    -- to create an new DNS record before removing an old record.
    --
    -- Resources that utilize the create_before_destroy key can only depend on
    -- other resources that also include create_before_destroy. Referencing a
    -- resource that does not include create_before_destroy will result in a
    -- dependency graph cycle.  prevent_destroy (bool) - This flag provides extra
    -- protection against the destruction of a given resource. When this is set to
    -- true, any plan that includes a destroy of this resource will return an error
    -- message.
    createBeforeDestroy :: Lens' a Bool
    createBeforeDestroy =
        lifecycle .
            lens _createBeforeDestroy
                (\s a -> s { _createBeforeDestroy = a })

    -- | Customizes how diffs are evaluated for resources, allowing individual
    -- attributes to be ignored through changes. As an example, this can be used to
    -- ignore dynamic changes to the resource from external resources. Other
    -- meta-parameters cannot be ignored.
    ignoreChanges :: ASetter' a (Changes b)
    ignoreChanges =
        lifecycle .
            lens _ignoreChanges
                (\s a -> s { _ignoreChanges = a })

instance HCL.ToHCL (Lifecycle a) where
   toHCL Lifecycle{..} =
       HCL.block
           [ HCL.assign "prevent_destroy"       _preventDestroy
           , HCL.assign "create_before_destroy" _createBeforeDestroy
           , HCL.assign "ignore_changes"        _ignoreChanges
           ]