-- This module is auto-generated.

{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleContexts       #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RecordWildCards        #-}
{-# LANGUAGE TemplateHaskell        #-}
{-# LANGUAGE UndecidableInstances   #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Lailgun.Resource
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Lailgun.Resource where

import Data.Functor ((<$>))
import Data.Maybe   (catMaybes)
import Data.Text    (Text)

import GHC.Base (Eq, ($))
import GHC.Show (Show)

import qualified Terrafomo.Lailgun.Provider as TF
import qualified Terrafomo.Lailgun.Types    as TF
import qualified Terrafomo.Syntax.HCL       as TF
import qualified Terrafomo.Syntax.Resource  as TF
import qualified Terrafomo.Syntax.Resource  as TF
import qualified Terrafomo.Syntax.Variable  as TF
import qualified Terrafomo.TH               as TF

{- | The @mailgun_domain@ Lailgun resource.

Provides a Mailgun App resource. This can be used to create and manage
applications on Mailgun.
-}
data DomainResource = DomainResource {
      _name                       :: !(TF.Argument Text)
    {- ^ (Required) The domain to add to Mailgun -}
    , _smtp_password              :: !(TF.Argument Text)
    {- ^ (Required) Password for SMTP authentication -}
    , _spam_action                :: !(TF.Argument Text)
    {- ^ (Optional) @disabled@ or @tag@ Disable, no spam filtering will occur for inbound messages. Tag, messages will be tagged with a spam header. -}
    , _wildcard                   :: !(TF.Argument Text)
    {- ^ (Optional) Boolean that determines whether the domain will accept email for sub-domains. -}
    , _computed_name              :: !(TF.Attribute Text)
    {- ^ - The name of the domain. -}
    , _computed_receiving_records :: !(TF.Attribute Text)
    {- ^ - A list of DNS records for receiving validation. -}
    , _computed_sending_records   :: !(TF.Attribute Text)
    {- ^ - A list of DNS records for sending validation. -}
    , _computed_smtp_login        :: !(TF.Attribute Text)
    {- ^ - The login email for the SMTP server. -}
    , _computed_smtp_password     :: !(TF.Attribute Text)
    {- ^ - The password to the SMTP server. -}
    , _computed_spam_action       :: !(TF.Attribute Text)
    {- ^ - The spam filtering setting. -}
    , _computed_wildcard          :: !(TF.Attribute Text)
    {- ^ - Whether or not the domain will accept email for sub-domains. -}
    } deriving (Show, Eq)

instance TF.ToHCL DomainResource where
    toHCL DomainResource{..} = TF.block $ catMaybes
        [ TF.assign "name" <$> TF.argument _name
        , TF.assign "smtp_password" <$> TF.argument _smtp_password
        , TF.assign "spam_action" <$> TF.argument _spam_action
        , TF.assign "wildcard" <$> TF.argument _wildcard
        ]

$(TF.makeSchemaLenses
    ''DomainResource
    ''TF.Lailgun
    ''TF.Resource)

domainResource :: TF.Resource TF.Lailgun DomainResource
domainResource =
    TF.newResource "mailgun_domain" $
        DomainResource {
            _name = TF.Nil
            , _smtp_password = TF.Nil
            , _spam_action = TF.Nil
            , _wildcard = TF.Nil
            , _computed_name = TF.Compute "name"
            , _computed_receiving_records = TF.Compute "receiving_records"
            , _computed_sending_records = TF.Compute "sending_records"
            , _computed_smtp_login = TF.Compute "smtp_login"
            , _computed_smtp_password = TF.Compute "smtp_password"
            , _computed_spam_action = TF.Compute "spam_action"
            , _computed_wildcard = TF.Compute "wildcard"
            }
