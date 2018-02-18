-- This module is auto-generated.

{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RecordWildCards        #-}
{-# LANGUAGE ScopedTypeVariables    #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Scaleway.DataSource
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Scaleway.DataSource
    (
    -- * Types
      BootscriptData (..)
    , bootscriptData

    , ImageData (..)
    , imageData

    -- * Overloaded Fields
    -- ** Arguments
    , P.HasArchitecture (..)
    , P.HasName (..)
    , P.HasNameFilter (..)

    -- ** Computed Attributes
    , P.HasComputedArchitecture (..)
    , P.HasComputedBootCmdArgs (..)
    , P.HasComputedCreationDate (..)
    , P.HasComputedDtb (..)
    , P.HasComputedInitrd (..)
    , P.HasComputedKernel (..)
    , P.HasComputedName (..)
    , P.HasComputedNameFilter (..)
    , P.HasComputedOrganization (..)
    , P.HasComputedPublic (..)

    -- * Re-exported Types
    , module P
    ) where

import Data.Functor ((<$>))
import Data.Maybe   (catMaybes)
import Data.Text    (Text)

import GHC.Base (Eq, ($), (.))
import GHC.Show (Show)

import Lens.Micro (lens)

import qualified Data.Word                   as P
import qualified GHC.Base                    as P
import qualified Numeric.Natural             as P
import qualified Terrafomo.IP                as P
import qualified Terrafomo.Scaleway.Lens     as P
import qualified Terrafomo.Scaleway.Provider as P
import           Terrafomo.Scaleway.Types    as P

import qualified Terrafomo.Attribute as TF
import qualified Terrafomo.HCL       as TF
import qualified Terrafomo.Name      as TF
import qualified Terrafomo.Schema    as TF

{- | The @scaleway_bootscript@ Scaleway datasource.

Use this data source to get the ID of a registered Bootscript for use with
the @scaleway_server@ resource.
-}
data BootscriptData s = BootscriptData {
      _architecture :: !(TF.Attr s Text)
    {- ^ (Optional) any supported Scaleway architecture, e.g. @x86_64@ , @arm@ -}
    , _name         :: !(TF.Attr s Text)
    {- ^ (Optional) Exact name of desired Bootscript -}
    , _name_filter  :: !(TF.Attr s Text)
    {- ^ (Optional) Regexp to match Bootscript name by -}
    } deriving (Show, Eq)

instance TF.ToHCL (BootscriptData s) where
    toHCL BootscriptData{..} = TF.inline $ catMaybes
        [ TF.assign "architecture" <$> TF.attribute _architecture
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "name_filter" <$> TF.attribute _name_filter
        ]

instance P.HasArchitecture (BootscriptData s) (TF.Attr s Text) where
    architecture =
        lens (_architecture :: BootscriptData s -> TF.Attr s Text)
             (\s a -> s { _architecture = a } :: BootscriptData s)

instance P.HasName (BootscriptData s) (TF.Attr s Text) where
    name =
        lens (_name :: BootscriptData s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: BootscriptData s)

instance P.HasNameFilter (BootscriptData s) (TF.Attr s Text) where
    nameFilter =
        lens (_name_filter :: BootscriptData s -> TF.Attr s Text)
             (\s a -> s { _name_filter = a } :: BootscriptData s)

instance P.HasComputedArchitecture (BootscriptData s) s (TF.Attr s Text) where
    computedArchitecture x = TF.compute (TF.refKey x) "architecture"

instance P.HasComputedBootCmdArgs (BootscriptData s) s (TF.Attr s Text) where
    computedBootCmdArgs x = TF.compute (TF.refKey x) "boot_cmd_args"

instance P.HasComputedDtb (BootscriptData s) s (TF.Attr s Text) where
    computedDtb x = TF.compute (TF.refKey x) "dtb"

instance P.HasComputedInitrd (BootscriptData s) s (TF.Attr s Text) where
    computedInitrd x = TF.compute (TF.refKey x) "initrd"

instance P.HasComputedKernel (BootscriptData s) s (TF.Attr s Text) where
    computedKernel x = TF.compute (TF.refKey x) "kernel"

instance P.HasComputedName (BootscriptData s) s (TF.Attr s Text) where
    computedName =
        (_name :: BootscriptData s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedNameFilter (BootscriptData s) s (TF.Attr s Text) where
    computedNameFilter =
        (_name_filter :: BootscriptData s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedOrganization (BootscriptData s) s (TF.Attr s Text) where
    computedOrganization x = TF.compute (TF.refKey x) "organization"

instance P.HasComputedPublic (BootscriptData s) s (TF.Attr s Text) where
    computedPublic x = TF.compute (TF.refKey x) "public"

bootscriptData :: TF.Schema TF.DataSource P.Scaleway (BootscriptData s)
bootscriptData =
    TF.newDataSource "scaleway_bootscript" $
        BootscriptData {
              _architecture = TF.Nil
            , _name = TF.Nil
            , _name_filter = TF.Nil
            }

{- | The @scaleway_image@ Scaleway datasource.

Use this data source to get the ID of a registered Image for use with the
@scaleway_server@ resource.
-}
data ImageData s = ImageData {
      _architecture :: !(TF.Attr s Text)
    {- ^ (Required) any supported Scaleway architecture, e.g. @x86_64@ , @arm@ -}
    , _name         :: !(TF.Attr s Text)
    {- ^ (Optional) Exact name of desired Image -}
    , _name_filter  :: !(TF.Attr s Text)
    {- ^ (Optional) Regexp to match Image name by -}
    } deriving (Show, Eq)

instance TF.ToHCL (ImageData s) where
    toHCL ImageData{..} = TF.inline $ catMaybes
        [ TF.assign "architecture" <$> TF.attribute _architecture
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "name_filter" <$> TF.attribute _name_filter
        ]

instance P.HasArchitecture (ImageData s) (TF.Attr s Text) where
    architecture =
        lens (_architecture :: ImageData s -> TF.Attr s Text)
             (\s a -> s { _architecture = a } :: ImageData s)

instance P.HasName (ImageData s) (TF.Attr s Text) where
    name =
        lens (_name :: ImageData s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: ImageData s)

instance P.HasNameFilter (ImageData s) (TF.Attr s Text) where
    nameFilter =
        lens (_name_filter :: ImageData s -> TF.Attr s Text)
             (\s a -> s { _name_filter = a } :: ImageData s)

instance P.HasComputedArchitecture (ImageData s) s (TF.Attr s Text) where
    computedArchitecture x = TF.compute (TF.refKey x) "architecture"

instance P.HasComputedCreationDate (ImageData s) s (TF.Attr s Text) where
    computedCreationDate x = TF.compute (TF.refKey x) "creation_date"

instance P.HasComputedName (ImageData s) s (TF.Attr s Text) where
    computedName =
        (_name :: ImageData s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedNameFilter (ImageData s) s (TF.Attr s Text) where
    computedNameFilter =
        (_name_filter :: ImageData s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedOrganization (ImageData s) s (TF.Attr s Text) where
    computedOrganization x = TF.compute (TF.refKey x) "organization"

instance P.HasComputedPublic (ImageData s) s (TF.Attr s Text) where
    computedPublic x = TF.compute (TF.refKey x) "public"

imageData :: TF.Schema TF.DataSource P.Scaleway (ImageData s)
imageData =
    TF.newDataSource "scaleway_image" $
        ImageData {
              _architecture = TF.Nil
            , _name = TF.Nil
            , _name_filter = TF.Nil
            }
