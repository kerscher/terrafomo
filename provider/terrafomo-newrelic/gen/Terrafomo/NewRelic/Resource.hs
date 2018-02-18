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
-- Module      : Terrafomo.NewRelic.Resource
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.NewRelic.Resource
    (
    -- * Types
      AlertChannelResource (..)
    , alertChannelResource

    , AlertConditionResource (..)
    , alertConditionResource

    , AlertPolicyChannelResource (..)
    , alertPolicyChannelResource

    , AlertPolicyResource (..)
    , alertPolicyResource

    , DashboardResource (..)
    , dashboardResource

    , NrqlAlertConditionResource (..)
    , nrqlAlertConditionResource

    -- * Overloaded Fields
    -- ** Arguments
    , P.HasChannelId (..)
    , P.HasConditionScope (..)
    , P.HasConfiguration (..)
    , P.HasEditable (..)
    , P.HasEnabled (..)
    , P.HasEntities (..)
    , P.HasGcMetric (..)
    , P.HasIcon (..)
    , P.HasIncidentPreference (..)
    , P.HasMetric (..)
    , P.HasName (..)
    , P.HasNrql (..)
    , P.HasPolicyId (..)
    , P.HasRunbookUrl (..)
    , P.HasTerm (..)
    , P.HasTitle (..)
    , P.HasType' (..)
    , P.HasUserDefinedMetric (..)
    , P.HasUserDefinedValueFunction (..)
    , P.HasValueFunction (..)
    , P.HasViolationCloseTimer (..)
    , P.HasVisibility (..)
    , P.HasWidget (..)

    -- ** Computed Attributes
    , P.HasComputedChannelId (..)
    , P.HasComputedConditionScope (..)
    , P.HasComputedConfiguration (..)
    , P.HasComputedCreatedAt (..)
    , P.HasComputedEditable (..)
    , P.HasComputedEnabled (..)
    , P.HasComputedEntities (..)
    , P.HasComputedGcMetric (..)
    , P.HasComputedIcon (..)
    , P.HasComputedId (..)
    , P.HasComputedIncidentPreference (..)
    , P.HasComputedMetric (..)
    , P.HasComputedName (..)
    , P.HasComputedNrql (..)
    , P.HasComputedPolicyId (..)
    , P.HasComputedRunbookUrl (..)
    , P.HasComputedTerm (..)
    , P.HasComputedTitle (..)
    , P.HasComputedType' (..)
    , P.HasComputedUpdatedAt (..)
    , P.HasComputedUserDefinedMetric (..)
    , P.HasComputedUserDefinedValueFunction (..)
    , P.HasComputedValueFunction (..)
    , P.HasComputedViolationCloseTimer (..)
    , P.HasComputedVisibility (..)
    , P.HasComputedWidget (..)

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
import qualified Terrafomo.NewRelic.Lens     as P
import qualified Terrafomo.NewRelic.Provider as P
import           Terrafomo.NewRelic.Types    as P

import qualified Terrafomo.Attribute as TF
import qualified Terrafomo.HCL       as TF
import qualified Terrafomo.Name      as TF
import qualified Terrafomo.Schema    as TF

{- | The @newrelic_alert_channel@ NewRelic resource.


-}
data AlertChannelResource s = AlertChannelResource {
      _configuration :: !(TF.Attr s Text)
    {- ^ (Required) A map of key / value pairs with channel type specific values. -}
    , _name          :: !(TF.Attr s Text)
    {- ^ (Required) The name of the channel. -}
    , _type'         :: !(TF.Attr s Text)
    {- ^ (Required) The type of channel.  One of: @campfire@ , @email@ , @hipchat@ , @opsgenie@ , @pagerduty@ , @slack@ , @victorops@ , or @webhook@ . -}
    } deriving (Show, Eq)

instance TF.ToHCL (AlertChannelResource s) where
    toHCL AlertChannelResource{..} = TF.inline $ catMaybes
        [ TF.assign "configuration" <$> TF.attribute _configuration
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "type" <$> TF.attribute _type'
        ]

instance P.HasConfiguration (AlertChannelResource s) (TF.Attr s Text) where
    configuration =
        lens (_configuration :: AlertChannelResource s -> TF.Attr s Text)
             (\s a -> s { _configuration = a } :: AlertChannelResource s)

instance P.HasName (AlertChannelResource s) (TF.Attr s Text) where
    name =
        lens (_name :: AlertChannelResource s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: AlertChannelResource s)

instance P.HasType' (AlertChannelResource s) (TF.Attr s Text) where
    type' =
        lens (_type' :: AlertChannelResource s -> TF.Attr s Text)
             (\s a -> s { _type' = a } :: AlertChannelResource s)

instance P.HasComputedConfiguration (AlertChannelResource s) s (TF.Attr s Text) where
    computedConfiguration =
        (_configuration :: AlertChannelResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedId (AlertChannelResource s) s (TF.Attr s Text) where
    computedId x = TF.compute (TF.refKey x) "id"

instance P.HasComputedName (AlertChannelResource s) s (TF.Attr s Text) where
    computedName =
        (_name :: AlertChannelResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedType' (AlertChannelResource s) s (TF.Attr s Text) where
    computedType' =
        (_type' :: AlertChannelResource s -> TF.Attr s Text)
            . TF.refValue

alertChannelResource :: TF.Schema TF.Resource P.NewRelic (AlertChannelResource s)
alertChannelResource =
    TF.newResource "newrelic_alert_channel" $
        AlertChannelResource {
              _configuration = TF.Nil
            , _name = TF.Nil
            , _type' = TF.Nil
            }

{- | The @newrelic_alert_condition@ NewRelic resource.


-}
data AlertConditionResource s = AlertConditionResource {
      _condition_scope             :: !(TF.Attr s Text)
    {- ^ (Optional) @instance@ or @application@ .  This is required if you are using the JVM plugin in New Relic. -}
    , _entities                    :: !(TF.Attr s Text)
    {- ^ (Required) The instance IDS associated with this condition. -}
    , _gc_metric                   :: !(TF.Attr s Text)
    {- ^ (Optional) A valid Garbage Collection metric e.g. @GC/G1 Young Generation@ . This is required if you are using @apm_jvm_metric@ with @gc_cpu_time@ condition type. -}
    , _metric                      :: !(TF.Attr s Text)
    {- ^ (Required) The metric field accepts parameters based on the @type@ set. -}
    , _name                        :: !(TF.Attr s Text)
    {- ^ (Required) The title of the condition -}
    , _policy_id                   :: !(TF.Attr s Text)
    {- ^ (Required) The ID of the policy where this condition should be used. -}
    , _runbook_url                 :: !(TF.Attr s Text)
    {- ^ (Optional) Runbook URL to display in notifications. -}
    , _term                        :: !(TF.Attr s Text)
    {- ^ (Required) A list of terms for this condition. See <#terms> below for details. -}
    , _type'                       :: !(TF.Attr s Text)
    {- ^ (Required) The type of condition. One of: @apm_app_metric@ , @apm_jvm_metric@ , @apm_kt_metric@ , @servers_metric@ , @browser_metric@ , @mobile_metric@ -}
    , _user_defined_metric         :: !(TF.Attr s Text)
    {- ^ (Optional) A custom metric to be evaluated. -}
    , _user_defined_value_function :: !(TF.Attr s Text)
    {- ^ (Optional) One of: @average@ , @min@ , @max@ , @total@ , or @sample_size@ . -}
    , _violation_close_timer       :: !(TF.Attr s Text)
    {- ^ (Optional) Automatically close instance-based violations, including JVM health metric violations, after the number of hours specified. Must be: @1@ , @2@ , @4@ , @8@ , @12@ or @24@ . -}
    } deriving (Show, Eq)

instance TF.ToHCL (AlertConditionResource s) where
    toHCL AlertConditionResource{..} = TF.inline $ catMaybes
        [ TF.assign "condition_scope" <$> TF.attribute _condition_scope
        , TF.assign "entities" <$> TF.attribute _entities
        , TF.assign "gc_metric" <$> TF.attribute _gc_metric
        , TF.assign "metric" <$> TF.attribute _metric
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "policy_id" <$> TF.attribute _policy_id
        , TF.assign "runbook_url" <$> TF.attribute _runbook_url
        , TF.assign "term" <$> TF.attribute _term
        , TF.assign "type" <$> TF.attribute _type'
        , TF.assign "user_defined_metric" <$> TF.attribute _user_defined_metric
        , TF.assign "user_defined_value_function" <$> TF.attribute _user_defined_value_function
        , TF.assign "violation_close_timer" <$> TF.attribute _violation_close_timer
        ]

instance P.HasConditionScope (AlertConditionResource s) (TF.Attr s Text) where
    conditionScope =
        lens (_condition_scope :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _condition_scope = a } :: AlertConditionResource s)

instance P.HasEntities (AlertConditionResource s) (TF.Attr s Text) where
    entities =
        lens (_entities :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _entities = a } :: AlertConditionResource s)

instance P.HasGcMetric (AlertConditionResource s) (TF.Attr s Text) where
    gcMetric =
        lens (_gc_metric :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _gc_metric = a } :: AlertConditionResource s)

instance P.HasMetric (AlertConditionResource s) (TF.Attr s Text) where
    metric =
        lens (_metric :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _metric = a } :: AlertConditionResource s)

instance P.HasName (AlertConditionResource s) (TF.Attr s Text) where
    name =
        lens (_name :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: AlertConditionResource s)

instance P.HasPolicyId (AlertConditionResource s) (TF.Attr s Text) where
    policyId =
        lens (_policy_id :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _policy_id = a } :: AlertConditionResource s)

instance P.HasRunbookUrl (AlertConditionResource s) (TF.Attr s Text) where
    runbookUrl =
        lens (_runbook_url :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _runbook_url = a } :: AlertConditionResource s)

instance P.HasTerm (AlertConditionResource s) (TF.Attr s Text) where
    term =
        lens (_term :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _term = a } :: AlertConditionResource s)

instance P.HasType' (AlertConditionResource s) (TF.Attr s Text) where
    type' =
        lens (_type' :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _type' = a } :: AlertConditionResource s)

instance P.HasUserDefinedMetric (AlertConditionResource s) (TF.Attr s Text) where
    userDefinedMetric =
        lens (_user_defined_metric :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _user_defined_metric = a } :: AlertConditionResource s)

instance P.HasUserDefinedValueFunction (AlertConditionResource s) (TF.Attr s Text) where
    userDefinedValueFunction =
        lens (_user_defined_value_function :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _user_defined_value_function = a } :: AlertConditionResource s)

instance P.HasViolationCloseTimer (AlertConditionResource s) (TF.Attr s Text) where
    violationCloseTimer =
        lens (_violation_close_timer :: AlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _violation_close_timer = a } :: AlertConditionResource s)

instance P.HasComputedConditionScope (AlertConditionResource s) s (TF.Attr s Text) where
    computedConditionScope =
        (_condition_scope :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedEntities (AlertConditionResource s) s (TF.Attr s Text) where
    computedEntities =
        (_entities :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedGcMetric (AlertConditionResource s) s (TF.Attr s Text) where
    computedGcMetric =
        (_gc_metric :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedId (AlertConditionResource s) s (TF.Attr s Text) where
    computedId x = TF.compute (TF.refKey x) "id"

instance P.HasComputedMetric (AlertConditionResource s) s (TF.Attr s Text) where
    computedMetric =
        (_metric :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedName (AlertConditionResource s) s (TF.Attr s Text) where
    computedName =
        (_name :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedPolicyId (AlertConditionResource s) s (TF.Attr s Text) where
    computedPolicyId =
        (_policy_id :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedRunbookUrl (AlertConditionResource s) s (TF.Attr s Text) where
    computedRunbookUrl =
        (_runbook_url :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedTerm (AlertConditionResource s) s (TF.Attr s Text) where
    computedTerm =
        (_term :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedType' (AlertConditionResource s) s (TF.Attr s Text) where
    computedType' =
        (_type' :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedUserDefinedMetric (AlertConditionResource s) s (TF.Attr s Text) where
    computedUserDefinedMetric =
        (_user_defined_metric :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedUserDefinedValueFunction (AlertConditionResource s) s (TF.Attr s Text) where
    computedUserDefinedValueFunction =
        (_user_defined_value_function :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedViolationCloseTimer (AlertConditionResource s) s (TF.Attr s Text) where
    computedViolationCloseTimer =
        (_violation_close_timer :: AlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

alertConditionResource :: TF.Schema TF.Resource P.NewRelic (AlertConditionResource s)
alertConditionResource =
    TF.newResource "newrelic_alert_condition" $
        AlertConditionResource {
              _condition_scope = TF.Nil
            , _entities = TF.Nil
            , _gc_metric = TF.Nil
            , _metric = TF.Nil
            , _name = TF.Nil
            , _policy_id = TF.Nil
            , _runbook_url = TF.Nil
            , _term = TF.Nil
            , _type' = TF.Nil
            , _user_defined_metric = TF.Nil
            , _user_defined_value_function = TF.Nil
            , _violation_close_timer = TF.Nil
            }

{- | The @newrelic_alert_policy_channel@ NewRelic resource.


-}
data AlertPolicyChannelResource s = AlertPolicyChannelResource {
      _channel_id :: !(TF.Attr s Text)
    {- ^ (Required) The ID of the channel. -}
    , _policy_id  :: !(TF.Attr s Text)
    {- ^ (Required) The ID of the policy. -}
    } deriving (Show, Eq)

instance TF.ToHCL (AlertPolicyChannelResource s) where
    toHCL AlertPolicyChannelResource{..} = TF.inline $ catMaybes
        [ TF.assign "channel_id" <$> TF.attribute _channel_id
        , TF.assign "policy_id" <$> TF.attribute _policy_id
        ]

instance P.HasChannelId (AlertPolicyChannelResource s) (TF.Attr s Text) where
    channelId =
        lens (_channel_id :: AlertPolicyChannelResource s -> TF.Attr s Text)
             (\s a -> s { _channel_id = a } :: AlertPolicyChannelResource s)

instance P.HasPolicyId (AlertPolicyChannelResource s) (TF.Attr s Text) where
    policyId =
        lens (_policy_id :: AlertPolicyChannelResource s -> TF.Attr s Text)
             (\s a -> s { _policy_id = a } :: AlertPolicyChannelResource s)

instance P.HasComputedChannelId (AlertPolicyChannelResource s) s (TF.Attr s Text) where
    computedChannelId =
        (_channel_id :: AlertPolicyChannelResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedPolicyId (AlertPolicyChannelResource s) s (TF.Attr s Text) where
    computedPolicyId =
        (_policy_id :: AlertPolicyChannelResource s -> TF.Attr s Text)
            . TF.refValue

alertPolicyChannelResource :: TF.Schema TF.Resource P.NewRelic (AlertPolicyChannelResource s)
alertPolicyChannelResource =
    TF.newResource "newrelic_alert_policy_channel" $
        AlertPolicyChannelResource {
              _channel_id = TF.Nil
            , _policy_id = TF.Nil
            }

{- | The @newrelic_alert_policy@ NewRelic resource.


-}
data AlertPolicyResource s = AlertPolicyResource {
      _incident_preference :: !(TF.Attr s Text)
    {- ^ (Optional) The rollup strategy for the policy.  Options include: @PER_POLICY@ , @PER_CONDITION@ , or @PER_CONDITION_AND_TARGET@ .  The default is @PER_POLICY@ . -}
    , _name                :: !(TF.Attr s Text)
    {- ^ (Required) The name of the policy. -}
    } deriving (Show, Eq)

instance TF.ToHCL (AlertPolicyResource s) where
    toHCL AlertPolicyResource{..} = TF.inline $ catMaybes
        [ TF.assign "incident_preference" <$> TF.attribute _incident_preference
        , TF.assign "name" <$> TF.attribute _name
        ]

instance P.HasIncidentPreference (AlertPolicyResource s) (TF.Attr s Text) where
    incidentPreference =
        lens (_incident_preference :: AlertPolicyResource s -> TF.Attr s Text)
             (\s a -> s { _incident_preference = a } :: AlertPolicyResource s)

instance P.HasName (AlertPolicyResource s) (TF.Attr s Text) where
    name =
        lens (_name :: AlertPolicyResource s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: AlertPolicyResource s)

instance P.HasComputedCreatedAt (AlertPolicyResource s) s (TF.Attr s Text) where
    computedCreatedAt x = TF.compute (TF.refKey x) "created_at"

instance P.HasComputedId (AlertPolicyResource s) s (TF.Attr s Text) where
    computedId x = TF.compute (TF.refKey x) "id"

instance P.HasComputedIncidentPreference (AlertPolicyResource s) s (TF.Attr s Text) where
    computedIncidentPreference =
        (_incident_preference :: AlertPolicyResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedName (AlertPolicyResource s) s (TF.Attr s Text) where
    computedName =
        (_name :: AlertPolicyResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedUpdatedAt (AlertPolicyResource s) s (TF.Attr s Text) where
    computedUpdatedAt x = TF.compute (TF.refKey x) "updated_at"

alertPolicyResource :: TF.Schema TF.Resource P.NewRelic (AlertPolicyResource s)
alertPolicyResource =
    TF.newResource "newrelic_alert_policy" $
        AlertPolicyResource {
              _incident_preference = TF.Nil
            , _name = TF.Nil
            }

{- | The @newrelic_dashboard@ NewRelic resource.


-}
data DashboardResource s = DashboardResource {
      _editable   :: !(TF.Attr s Text)
    {- ^ (Optional) Who can edit the dashboard in an account. Must be @read_only@ , @editable_by_owner@ , @editable_by_all@ , or @all@ . Defaults to @editable_by_all@ . -}
    , _icon       :: !(TF.Attr s Text)
    {- ^ (Optional) The icon for the dashboard.  Defaults to @bar-chart@ . -}
    , _title      :: !(TF.Attr s Text)
    {- ^ (Required) The title of the dashboard. -}
    , _visibility :: !(TF.Attr s Text)
    {- ^ (Optional) Who can see the dashboard in an account. Must be @owner@ or @all@ . Defaults to @all@ . -}
    , _widget     :: !(TF.Attr s Text)
    {- ^ (Optional) A widget that describes a visualization. See <#widgets> below for details. -}
    } deriving (Show, Eq)

instance TF.ToHCL (DashboardResource s) where
    toHCL DashboardResource{..} = TF.inline $ catMaybes
        [ TF.assign "editable" <$> TF.attribute _editable
        , TF.assign "icon" <$> TF.attribute _icon
        , TF.assign "title" <$> TF.attribute _title
        , TF.assign "visibility" <$> TF.attribute _visibility
        , TF.assign "widget" <$> TF.attribute _widget
        ]

instance P.HasEditable (DashboardResource s) (TF.Attr s Text) where
    editable =
        lens (_editable :: DashboardResource s -> TF.Attr s Text)
             (\s a -> s { _editable = a } :: DashboardResource s)

instance P.HasIcon (DashboardResource s) (TF.Attr s Text) where
    icon =
        lens (_icon :: DashboardResource s -> TF.Attr s Text)
             (\s a -> s { _icon = a } :: DashboardResource s)

instance P.HasTitle (DashboardResource s) (TF.Attr s Text) where
    title =
        lens (_title :: DashboardResource s -> TF.Attr s Text)
             (\s a -> s { _title = a } :: DashboardResource s)

instance P.HasVisibility (DashboardResource s) (TF.Attr s Text) where
    visibility =
        lens (_visibility :: DashboardResource s -> TF.Attr s Text)
             (\s a -> s { _visibility = a } :: DashboardResource s)

instance P.HasWidget (DashboardResource s) (TF.Attr s Text) where
    widget =
        lens (_widget :: DashboardResource s -> TF.Attr s Text)
             (\s a -> s { _widget = a } :: DashboardResource s)

instance P.HasComputedEditable (DashboardResource s) s (TF.Attr s Text) where
    computedEditable =
        (_editable :: DashboardResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedIcon (DashboardResource s) s (TF.Attr s Text) where
    computedIcon =
        (_icon :: DashboardResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedId (DashboardResource s) s (TF.Attr s Text) where
    computedId x = TF.compute (TF.refKey x) "id"

instance P.HasComputedTitle (DashboardResource s) s (TF.Attr s Text) where
    computedTitle =
        (_title :: DashboardResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedVisibility (DashboardResource s) s (TF.Attr s Text) where
    computedVisibility =
        (_visibility :: DashboardResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedWidget (DashboardResource s) s (TF.Attr s Text) where
    computedWidget =
        (_widget :: DashboardResource s -> TF.Attr s Text)
            . TF.refValue

dashboardResource :: TF.Schema TF.Resource P.NewRelic (DashboardResource s)
dashboardResource =
    TF.newResource "newrelic_dashboard" $
        DashboardResource {
              _editable = TF.Nil
            , _icon = TF.Nil
            , _title = TF.Nil
            , _visibility = TF.Nil
            , _widget = TF.Nil
            }

{- | The @newrelic_nrql_alert_condition@ NewRelic resource.


-}
data NrqlAlertConditionResource s = NrqlAlertConditionResource {
      _enabled        :: !(TF.Attr s Text)
    {- ^ (Optional) Set whether to enable the alert condition. Defaults to @true@ . -}
    , _name           :: !(TF.Attr s Text)
    {- ^ (Required) The title of the condition -}
    , _nrql           :: !(TF.Attr s Text)
    {- ^ (Required) A NRQL query. See <#nrql> below for details. -}
    , _policy_id      :: !(TF.Attr s Text)
    {- ^ (Required) The ID of the policy where this condition should be used. -}
    , _runbook_url    :: !(TF.Attr s Text)
    {- ^ (Optional) Runbook URL to display in notifications. -}
    , _term           :: !(TF.Attr s Text)
    {- ^ (Required) A list of terms for this condition. See <#terms> below for details. -}
    , _value_function :: !(TF.Attr s Text)
    {- ^ (Optional) Possible values are @single_value@ , @sum@ . -}
    } deriving (Show, Eq)

instance TF.ToHCL (NrqlAlertConditionResource s) where
    toHCL NrqlAlertConditionResource{..} = TF.inline $ catMaybes
        [ TF.assign "enabled" <$> TF.attribute _enabled
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "nrql" <$> TF.attribute _nrql
        , TF.assign "policy_id" <$> TF.attribute _policy_id
        , TF.assign "runbook_url" <$> TF.attribute _runbook_url
        , TF.assign "term" <$> TF.attribute _term
        , TF.assign "value_function" <$> TF.attribute _value_function
        ]

instance P.HasEnabled (NrqlAlertConditionResource s) (TF.Attr s Text) where
    enabled =
        lens (_enabled :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _enabled = a } :: NrqlAlertConditionResource s)

instance P.HasName (NrqlAlertConditionResource s) (TF.Attr s Text) where
    name =
        lens (_name :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _name = a } :: NrqlAlertConditionResource s)

instance P.HasNrql (NrqlAlertConditionResource s) (TF.Attr s Text) where
    nrql =
        lens (_nrql :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _nrql = a } :: NrqlAlertConditionResource s)

instance P.HasPolicyId (NrqlAlertConditionResource s) (TF.Attr s Text) where
    policyId =
        lens (_policy_id :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _policy_id = a } :: NrqlAlertConditionResource s)

instance P.HasRunbookUrl (NrqlAlertConditionResource s) (TF.Attr s Text) where
    runbookUrl =
        lens (_runbook_url :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _runbook_url = a } :: NrqlAlertConditionResource s)

instance P.HasTerm (NrqlAlertConditionResource s) (TF.Attr s Text) where
    term =
        lens (_term :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _term = a } :: NrqlAlertConditionResource s)

instance P.HasValueFunction (NrqlAlertConditionResource s) (TF.Attr s Text) where
    valueFunction =
        lens (_value_function :: NrqlAlertConditionResource s -> TF.Attr s Text)
             (\s a -> s { _value_function = a } :: NrqlAlertConditionResource s)

instance P.HasComputedEnabled (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedEnabled =
        (_enabled :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedId (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedId x = TF.compute (TF.refKey x) "id"

instance P.HasComputedName (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedName =
        (_name :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedNrql (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedNrql =
        (_nrql :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedPolicyId (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedPolicyId =
        (_policy_id :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedRunbookUrl (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedRunbookUrl =
        (_runbook_url :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedTerm (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedTerm =
        (_term :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

instance P.HasComputedValueFunction (NrqlAlertConditionResource s) s (TF.Attr s Text) where
    computedValueFunction =
        (_value_function :: NrqlAlertConditionResource s -> TF.Attr s Text)
            . TF.refValue

nrqlAlertConditionResource :: TF.Schema TF.Resource P.NewRelic (NrqlAlertConditionResource s)
nrqlAlertConditionResource =
    TF.newResource "newrelic_nrql_alert_condition" $
        NrqlAlertConditionResource {
              _enabled = TF.Nil
            , _name = TF.Nil
            , _nrql = TF.Nil
            , _policy_id = TF.Nil
            , _runbook_url = TF.Nil
            , _term = TF.Nil
            , _value_function = TF.Nil
            }
