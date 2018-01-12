-- This module is auto-generated.

{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Cloudflare.Provider
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Cloudflare.Provider
    ( Cloudflare    (..)
    , HasCloudflare (..)
    ) where

import Data.Function      (on)
import Data.Hashable      (Hashable)
import Data.List.NonEmpty (NonEmpty ((:|)))
import Data.Maybe         (catMaybes)
import Data.Proxy         (Proxy (Proxy))
import Data.Semigroup     (Semigroup ((<>)))
import Data.Text          (Text)

import GHC.Generics (Generic)

import qualified Terrafomo.Cloudflare.Types as TF
import qualified Terrafomo.Syntax.HCL       as TF
import qualified Terrafomo.Syntax.Meta      as TF
import qualified Terrafomo.Syntax.Name      as TF
import qualified Terrafomo.Syntax.Variable  as TF
import qualified Terrafomo.TH               as TF

{- | Cloudflare Terraform provider.

The Cloudflare provider is used to interact with the DNS resources supported
by Cloudflare. The provider needs to be configured with the proper
credentials before it can be used. Use the navigation to the left to read
about the available resources.
-}
data Cloudflare = Cloudflare {
      _email :: !(TF.Argument Text)
    {- ^ (Required) The email associated with the account. This can also be specified with the @CLOUDFLARE_EMAIL@ shell environment variable. -}
    , _token :: !(TF.Argument Text)
    {- ^ (Required) The Cloudflare API token. This can also be specified with the @CLOUDFLARE_TOKEN@ shell environment variable. -}
    } deriving (Show, Eq, Generic)

instance Hashable Cloudflare

instance TF.ToHCL Cloudflare where
    toHCL x =
        TF.object ("provider" :| [TF.name (TF.providerName (Proxy :: Proxy Cloudflare))]) $ catMaybes
            [ Just $ TF.assign "alias" (TF.toHCL (TF.providerAlias x))
            , TF.assign "email" <$> TF.argument (_email x)
            , TF.assign "token" <$> TF.argument (_token x)
            ]

instance Semigroup Cloudflare where
    (<>) a b = Cloudflare {
          _email = on (<>) _email a b
        , _token = on (<>) _token a b
        }

instance Monoid Cloudflare where
    mappend = (<>)
    mempty  = Cloudflare {
            _email = TF.Nil
          , _token = TF.Nil
        }

instance TF.IsProvider Cloudflare where
    type ProviderName Cloudflare = "cloudflare"

$(TF.makeProviderLenses ''Cloudflare)
