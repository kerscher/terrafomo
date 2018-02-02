-- This module is auto-generated.

{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE PolyKinds              #-}
{-# LANGUAGE RankNTypes             #-}
{-# LANGUAGE RecordWildCards        #-}
{-# LANGUAGE ScopedTypeVariables    #-}
{-# LANGUAGE UndecidableInstances   #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Cloudflare.Data
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Cloudflare.Data
    (
    -- * Types
      IpRangesData (..)
    , ipRangesData

    -- * Overloaded Fields
    -- ** Arguments

    -- ** Computed Attributes
    , HasComputedCidrBlocks (..)
    , HasComputedIpv4CidrBlocks (..)
    , HasComputedIpv6CidrBlocks (..)
    ) where

import Data.Maybe (catMaybes)
import Data.Text  (Text)

import GHC.Base (Eq, ($), (.))
import GHC.Show (Show)

import Lens.Micro (Getting, Lens', lens, to)

import qualified Data.Word                     as TF
import qualified GHC.Base                      as TF
import qualified Numeric.Natural               as TF
import qualified Terrafomo.Attribute           as TF
import qualified Terrafomo.Cloudflare.Provider as TF
import qualified Terrafomo.Cloudflare.Types    as TF
import qualified Terrafomo.Data                as TF
import qualified Terrafomo.HCL                 as TF
import qualified Terrafomo.IP                  as TF
import qualified Terrafomo.Meta                as TF
import qualified Terrafomo.Name                as TF
import qualified Terrafomo.Resource            as TF

{- | The @cloudflare_ip_ranges@ Cloudflare data.

Use this data source to get the <https://www.cloudflare.com/ips/> of
CloudFlare edge nodes.
-}
data IpRangesData s = IpRangesData {
    } deriving (Show, Eq)

instance TF.ToHCL (IpRangesData s) where
    toHCL _ = TF.block []

instance HasComputedCidrBlocks (IpRangesData s) Text

instance HasComputedIpv4CidrBlocks (IpRangesData s) Text

instance HasComputedIpv6CidrBlocks (IpRangesData s) Text

ipRangesData :: TF.Data TF.Cloudflare (IpRangesData s)
ipRangesData =
    TF.newData "cloudflare_ip_ranges" $
        IpRangesData {
            }

class HasComputedCidrBlocks a b | a -> b where
    computedCidrBlocks
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedCidrBlocks =
        to (\x -> TF.Computed (TF.referenceKey x) "cidr_blocks")

class HasComputedIpv4CidrBlocks a b | a -> b where
    computedIpv4CidrBlocks
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedIpv4CidrBlocks =
        to (\x -> TF.Computed (TF.referenceKey x) "ipv4_cidr_blocks")

class HasComputedIpv6CidrBlocks a b | a -> b where
    computedIpv6CidrBlocks
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedIpv6CidrBlocks =
        to (\x -> TF.Computed (TF.referenceKey x) "ipv6_cidr_blocks")