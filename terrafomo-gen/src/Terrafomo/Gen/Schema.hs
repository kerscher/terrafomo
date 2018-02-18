{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE LambdaCase          #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TupleSections       #-}

module Terrafomo.Gen.Schema where

import Data.Aeson      (FromJSON, ToJSON, (.!=), (.:?), (.=))
import Data.Bifunctor  (bimap)
import Data.Function   (on)
import Data.Map.Strict (Map)
import Data.Maybe      (mapMaybe)
import Data.Monoid     (Last (..))
import Data.Semigroup  (Semigroup ((<>)))
import Data.Set        (Set)
import Data.Text       (Text)

import GHC.Generics (Generic)

import Terrafomo.Gen.Text

import qualified Data.Aeson         as JSON
import qualified Data.Map.Strict    as Map
import qualified Data.Set           as Set
import qualified Terrafomo.Gen.JSON as JSON

-- Syntax Types

data SchemaType
    = Resource
    | DataSource
      deriving (Show, Eq, Ord)

instance ToJSON SchemaType where
    toJSON = JSON.toJSON . show

data Format
   = Repeated
   | Attribute
   | Verbatim
     deriving (Show, Eq, Ord, Generic)

instance ToJSON Format where
    toJSON = JSON.genericToJSON (JSON.options "")

instance FromJSON Format where
    parseJSON = JSON.genericParseJSON (JSON.options "")

data Type = Type
    { typeName   :: !Text
    , typeFormat :: !Format
    } deriving (Show, Eq, Ord, Generic)

instance ToJSON Type where
    toJSON Type{..} = JSON.object
        [ "name"       .= typeName
        , "parametric" .= parametric
        , "applied"    .= fullyApplied
        , "encoder"    .= encoder
        , "default"    .= default'
        ]
      where
        (parametric, fullyApplied, encoder, default') =
            case typeFormat of
                Verbatim ->
                    ( "P.Maybe b"            :: Text
                    , "P.Maybe " <> typeName :: Text
                    , ""                     :: Text
                    , "P.Nothing"            :: Text
                    )
                Repeated ->
                    ( "P.Maybe [TF.Attr s b]"
                    , "P.Maybe [TF.Attr s " <> typeName <> "]"
                    , "TF.repeated"
                    , "P.Nothing"
                    )
                Attribute ->
                    ( "TF.Attr s b"
                    , "TF.Attr s " <> typeName
                    , "TF.attribute"
                    , "TF.Nil"
                    )

instance FromJSON Type where
    parseJSON = \case
        JSON.String s -> pure $! defaultType { typeName = s }
        v             -> JSON.genericParseJSON (JSON.options "type") v

defaultType :: Type
defaultType = Type
    { typeName   = "Text"
    , typeFormat = Attribute
    }

data Field = Field
    { fieldClass    :: !Text
    , fieldMethod   :: !Text
    , fieldLabel    :: !Text
    , fieldName     :: !Text
    , fieldType     :: !Type
    , fieldComputed :: !Bool
    } deriving (Show, Eq, Ord, Generic)

instance ToJSON Field where
    toJSON = JSON.genericToJSON (JSON.options "field")

getFields :: Schema -> (Set Field, Set Field)
getFields Schema{..} =
    ( args
    , Set.fromList $ Map.elems
        ( attrs True  schemaAttributes
       <> attrs False (fmap attributeArgument schemaArguments)
        )
    )
  where
    args =
          Set.fromList
        $ mapMaybe (\(k, v) ->
            go k k False
                <$> getLast (argName v) <*> getLast (argType v))
          (Map.toList schemaArguments)

    attrs computed =
        Map.mapMaybeWithKey (\k v ->
            go k (safeAttrName k) computed
                <$> getLast (attrName v) <*> getLast (attrType v))

    go k k' computed name ty =
        Field { fieldClass    = fieldClassName  k'
              , fieldMethod   = fieldMethodName k'
              , fieldLabel    = k
              , fieldName     = name
              , fieldType     = ty
              , fieldComputed = computed
              }

    attributeArgument Arg{..} =
        Attr { attrName = argName
             , attrHelp = argHelp
             , attrType = argType
             }

data Class = Class
    { className   :: !Text
    , classMethod :: !Text
    } deriving (Show, Eq, Ord, Generic)

instance ToJSON Class where
    toJSON = JSON.genericToJSON (JSON.options "class")

getClasses :: [Schema] -> (Set Class, Set Class)
getClasses =
    bimap Set.unions Set.unions . unzip . map (bimap go go . getFields)
  where
    go = Set.map $ \x ->
        Class { className   = fieldClass  x
              , classMethod = fieldMethod x
              }

data Schema = Schema
    { schemaName       :: !(Last Text)
    , schemaAbout      :: !(Maybe Text)
    , schemaDeprecated :: !Bool
    , schemaArguments  :: !(Map Text Arg)
    , schemaAttributes :: !(Map Text Attr)
    } deriving (Show, Generic)

instance Semigroup Schema where
    (<>) parsed saved = Schema
        { schemaName       = schemaName     parsed
        , schemaAbout      = schemaAbout    parsed
        , schemaDeprecated = on (||) schemaDeprecated parsed saved
        , schemaArguments  =
            on (Map.unionWith (<>)) schemaArguments  parsed saved
        , schemaAttributes =
            on (Map.unionWith (<>)) schemaAttributes parsed saved
          -- FIXME: make sure to delete config old keys.
        }

instance ToJSON Schema where
    toJSON x@Schema{..} =
        let (argFields, attrFields) = getFields x
         in JSON.object
            [ "name"            .= schemaName
            , "about"           .= schemaAbout
            , "deprecated"      .= schemaDeprecated
            , "arguments"       .= schemaArguments
            , "attributes"      .= schemaAttributes
            , "argumentFields"  .= argFields
            , "attributeFields" .= attrFields
            ]

instance FromJSON Schema where
    parseJSON = JSON.withObject "Schema" $ \o -> do
        schemaName       <- o .:? "name"       .!= mempty
        schemaAbout      <- o .:? "about"
        schemaDeprecated <- o .:? "deprecated" .!= False
        schemaArguments  <- o .:? "arguments"  .!= mempty
        schemaAttributes <- o .:? "attributes" .!= mempty
        pure Schema{..}

applyDeprecations :: Schema -> Maybe Schema
applyDeprecations x
    | schemaDeprecated x = Nothing
    | otherwise          = Just $
        x { schemaArguments =
              Map.filter ((/= True) . argIgnored) (schemaArguments x)
          }

-- > * `fieldname` - (Optional) documentation
data Arg = Arg
    { argName     :: !(Last Text)
    , argHelp     :: !(Last Text)
    , argRequired :: !Bool
    , argIgnored  :: !Bool
    , argType     :: !(Last Type)
    } deriving (Show, Eq, Ord, Generic)

instance Semigroup Arg where
    (<>) parsed saved = Arg
        { argName     = on (<>) argName     parsed saved
        , argHelp     = on (<>) argHelp     parsed saved
        , argRequired = on (||) argRequired parsed saved
        , argIgnored  = on (||) argIgnored  parsed saved
        , argType     = on (<>) argType     parsed saved
        }

instance ToJSON Arg where
    toJSON = JSON.genericToJSON (JSON.options "arg")

instance FromJSON Arg where
    parseJSON = JSON.withObject "Argument" $ \o -> do
        argName     <- o .:? "name"     .!= mempty
        argHelp     <- o .:? "help"     .!= mempty
        argRequired <- o .:? "required" .!= False
        argIgnored  <- o .:? "ignored"  .!= False
        argType     <- o .:? "type"     .!= mempty
        pure Arg{..}

-- > * `name` - documentation
data Attr = Attr
    { attrName :: !(Last Text)
    , attrHelp :: !(Last Text)
    , attrType :: !(Last Type)
    } deriving (Show, Eq, Ord, Generic)

instance Semigroup Attr where
    (<>) parsed saved = Attr
        { attrName     = on (<>) attrName     parsed saved
        , attrHelp     = on (<>) attrHelp     parsed saved
        , attrType     = on (<>) attrType     parsed saved
        }

instance ToJSON Attr where
    toJSON = JSON.genericToJSON (JSON.options "attr")

instance FromJSON Attr where
    parseJSON = JSON.withObject "Attribute" $ \o -> do
        attrName <- o .:? "name" .!= mempty
        attrHelp <- o .:? "help" .!= mempty
        attrType <- o .:? "type" .!= mempty
        pure Attr{..}
