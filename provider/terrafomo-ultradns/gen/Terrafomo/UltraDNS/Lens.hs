-- This module is auto-generated.

{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RankNTypes             #-}
{-# LANGUAGE UndecidableInstances   #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.UltraDNS.Lens
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.UltraDNS.Lens
    (
    -- * Overloaded Fields
    -- ** Arguments
      HasActOnProbes (..)
    , HasAgents (..)
    , HasBackupRecordFailoverDelay (..)
    , HasBackupRecordRdata (..)
    , HasConflictResolve (..)
    , HasDescription (..)
    , HasHttpProbe (..)
    , HasInterval (..)
    , HasMaxToLb (..)
    , HasName (..)
    , HasNoResponse (..)
    , HasOrder (..)
    , HasPingProbe (..)
    , HasPoolRecord (..)
    , HasRdata (..)
    , HasRunProbes (..)
    , HasThreshold (..)
    , HasTtl (..)
    , HasType' (..)
    , HasZone (..)

    -- ** Computed Attributes
    , HasComputedActOnProbes (..)
    , HasComputedAgents (..)
    , HasComputedBackupRecordFailoverDelay (..)
    , HasComputedBackupRecordRdata (..)
    , HasComputedConflictResolve (..)
    , HasComputedDescription (..)
    , HasComputedHostname (..)
    , HasComputedHttpProbe (..)
    , HasComputedId (..)
    , HasComputedInterval (..)
    , HasComputedMaxToLb (..)
    , HasComputedName (..)
    , HasComputedNoResponse (..)
    , HasComputedOrder (..)
    , HasComputedPingProbe (..)
    , HasComputedPoolRecord (..)
    , HasComputedRdata (..)
    , HasComputedRunProbes (..)
    , HasComputedThreshold (..)
    , HasComputedTtl (..)
    , HasComputedType' (..)
    , HasComputedZone (..)
    ) where

import GHC.Base ((.))

import Lens.Micro (Lens', lens)

import qualified Terrafomo.Attribute as TF
import qualified Terrafomo.Name      as TF
import qualified Terrafomo.Schema    as TF

class HasActOnProbes a b | a -> b where
    actOnProbes :: Lens' a b

instance HasActOnProbes a b => HasActOnProbes (TF.Schema l p a) b where
    actOnProbes = TF.configuration . actOnProbes

class HasAgents a b | a -> b where
    agents :: Lens' a b

instance HasAgents a b => HasAgents (TF.Schema l p a) b where
    agents = TF.configuration . agents

class HasBackupRecordFailoverDelay a b | a -> b where
    backupRecordFailoverDelay :: Lens' a b

instance HasBackupRecordFailoverDelay a b => HasBackupRecordFailoverDelay (TF.Schema l p a) b where
    backupRecordFailoverDelay = TF.configuration . backupRecordFailoverDelay

class HasBackupRecordRdata a b | a -> b where
    backupRecordRdata :: Lens' a b

instance HasBackupRecordRdata a b => HasBackupRecordRdata (TF.Schema l p a) b where
    backupRecordRdata = TF.configuration . backupRecordRdata

class HasConflictResolve a b | a -> b where
    conflictResolve :: Lens' a b

instance HasConflictResolve a b => HasConflictResolve (TF.Schema l p a) b where
    conflictResolve = TF.configuration . conflictResolve

class HasDescription a b | a -> b where
    description :: Lens' a b

instance HasDescription a b => HasDescription (TF.Schema l p a) b where
    description = TF.configuration . description

class HasHttpProbe a b | a -> b where
    httpProbe :: Lens' a b

instance HasHttpProbe a b => HasHttpProbe (TF.Schema l p a) b where
    httpProbe = TF.configuration . httpProbe

class HasInterval a b | a -> b where
    interval :: Lens' a b

instance HasInterval a b => HasInterval (TF.Schema l p a) b where
    interval = TF.configuration . interval

class HasMaxToLb a b | a -> b where
    maxToLb :: Lens' a b

instance HasMaxToLb a b => HasMaxToLb (TF.Schema l p a) b where
    maxToLb = TF.configuration . maxToLb

class HasName a b | a -> b where
    name :: Lens' a b

instance HasName a b => HasName (TF.Schema l p a) b where
    name = TF.configuration . name

class HasNoResponse a b | a -> b where
    noResponse :: Lens' a b

instance HasNoResponse a b => HasNoResponse (TF.Schema l p a) b where
    noResponse = TF.configuration . noResponse

class HasOrder a b | a -> b where
    order :: Lens' a b

instance HasOrder a b => HasOrder (TF.Schema l p a) b where
    order = TF.configuration . order

class HasPingProbe a b | a -> b where
    pingProbe :: Lens' a b

instance HasPingProbe a b => HasPingProbe (TF.Schema l p a) b where
    pingProbe = TF.configuration . pingProbe

class HasPoolRecord a b | a -> b where
    poolRecord :: Lens' a b

instance HasPoolRecord a b => HasPoolRecord (TF.Schema l p a) b where
    poolRecord = TF.configuration . poolRecord

class HasRdata a b | a -> b where
    rdata :: Lens' a b

instance HasRdata a b => HasRdata (TF.Schema l p a) b where
    rdata = TF.configuration . rdata

class HasRunProbes a b | a -> b where
    runProbes :: Lens' a b

instance HasRunProbes a b => HasRunProbes (TF.Schema l p a) b where
    runProbes = TF.configuration . runProbes

class HasThreshold a b | a -> b where
    threshold :: Lens' a b

instance HasThreshold a b => HasThreshold (TF.Schema l p a) b where
    threshold = TF.configuration . threshold

class HasTtl a b | a -> b where
    ttl :: Lens' a b

instance HasTtl a b => HasTtl (TF.Schema l p a) b where
    ttl = TF.configuration . ttl

class HasType' a b | a -> b where
    type' :: Lens' a b

instance HasType' a b => HasType' (TF.Schema l p a) b where
    type' = TF.configuration . type'

class HasZone a b | a -> b where
    zone :: Lens' a b

instance HasZone a b => HasZone (TF.Schema l p a) b where
    zone = TF.configuration . zone

class HasComputedActOnProbes a s b | a -> s b where
    computedActOnProbes :: TF.Ref s a -> b

class HasComputedAgents a s b | a -> s b where
    computedAgents :: TF.Ref s a -> b

class HasComputedBackupRecordFailoverDelay a s b | a -> s b where
    computedBackupRecordFailoverDelay :: TF.Ref s a -> b

class HasComputedBackupRecordRdata a s b | a -> s b where
    computedBackupRecordRdata :: TF.Ref s a -> b

class HasComputedConflictResolve a s b | a -> s b where
    computedConflictResolve :: TF.Ref s a -> b

class HasComputedDescription a s b | a -> s b where
    computedDescription :: TF.Ref s a -> b

class HasComputedHostname a s b | a -> s b where
    computedHostname :: TF.Ref s a -> b

class HasComputedHttpProbe a s b | a -> s b where
    computedHttpProbe :: TF.Ref s a -> b

class HasComputedId a s b | a -> s b where
    computedId :: TF.Ref s a -> b

class HasComputedInterval a s b | a -> s b where
    computedInterval :: TF.Ref s a -> b

class HasComputedMaxToLb a s b | a -> s b where
    computedMaxToLb :: TF.Ref s a -> b

class HasComputedName a s b | a -> s b where
    computedName :: TF.Ref s a -> b

class HasComputedNoResponse a s b | a -> s b where
    computedNoResponse :: TF.Ref s a -> b

class HasComputedOrder a s b | a -> s b where
    computedOrder :: TF.Ref s a -> b

class HasComputedPingProbe a s b | a -> s b where
    computedPingProbe :: TF.Ref s a -> b

class HasComputedPoolRecord a s b | a -> s b where
    computedPoolRecord :: TF.Ref s a -> b

class HasComputedRdata a s b | a -> s b where
    computedRdata :: TF.Ref s a -> b

class HasComputedRunProbes a s b | a -> s b where
    computedRunProbes :: TF.Ref s a -> b

class HasComputedThreshold a s b | a -> s b where
    computedThreshold :: TF.Ref s a -> b

class HasComputedTtl a s b | a -> s b where
    computedTtl :: TF.Ref s a -> b

class HasComputedType' a s b | a -> s b where
    computedType' :: TF.Ref s a -> b

class HasComputedZone a s b | a -> s b where
    computedZone :: TF.Ref s a -> b
