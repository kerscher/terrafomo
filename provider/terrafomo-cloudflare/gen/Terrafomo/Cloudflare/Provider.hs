-- This module is auto-generated.

{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Cloudflare.Provider
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Cloudflare.Provider
    (
    -- * Provider Datatype
      Cloudflare (..)
    , emptyCloudflare

    -- * Lenses
    , providerEmail
    , providerToken
    ) where

import Data.Hashable      (Hashable)
import Data.List.NonEmpty (NonEmpty ((:|)))
import Data.Maybe         (catMaybes)
import Data.Proxy         (Proxy (Proxy))

import GHC.Generics (Generic)

import Lens.Micro (Lens', lens)

import qualified Data.Text                  as P
import qualified Terrafomo.Cloudflare.Types as P
import qualified Terrafomo.IP               as P

import qualified Terrafomo.HCL      as TF
import qualified Terrafomo.Name     as TF
import qualified Terrafomo.Provider as TF

{- | Cloudflare Terraform provider.

The Cloudflare provider is used to interact with the DNS resources supported
by Cloudflare. The provider needs to be configured with the proper
credentials before it can be used. Use the navigation to the left to read
about the available resources.
-}
data Cloudflare = Cloudflare {
      _email :: !(Maybe P.Text)
    {- ^ (Required) The email associated with the account. This can also be specified with the @CLOUDFLARE_EMAIL@ shell environment variable. -}
    , _token :: !(Maybe P.Text)
    {- ^ (Required) The Cloudflare API token. This can also be specified with the @CLOUDFLARE_TOKEN@ shell environment variable. -}
    } deriving (Show, Eq, Generic)

instance Hashable Cloudflare

instance TF.ToHCL Cloudflare where
    toHCL x =
        let typ = TF.providerType (Proxy :: Proxy (Cloudflare))
            key = TF.providerKey x
         in TF.object ("provider" :| [TF.type_ typ]) $ catMaybes
            [ Just $ TF.assign "alias" (TF.toHCL (TF.keyName key))
            , TF.assign "email" <$> _email x
            , TF.assign "token" <$> _token x
            ]

instance TF.IsProvider Cloudflare where
    type ProviderType Cloudflare = "cloudflare"

emptyCloudflare :: Cloudflare
emptyCloudflare = Cloudflare {
        _email = Nothing
      , _token = Nothing
    }

providerEmail :: Lens' Cloudflare (Maybe P.Text)
providerEmail =
    lens _email (\s a -> s { _email = a })

providerToken :: Lens' Cloudflare (Maybe P.Text)
providerToken =
    lens _token (\s a -> s { _token = a })
