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
-- Module      : Terrafomo.GitHub.Data
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.GitHub.Data
    (
    -- * Types
      TeamData (..)
    , teamData

    , UserData (..)
    , userData

    -- * Overloaded Fields
    -- ** Arguments
    , HasSlug (..)
    , HasUsername (..)

    -- ** Computed Attributes
    , HasComputedAvatarUrl (..)
    , HasComputedBio (..)
    , HasComputedBlog (..)
    , HasComputedCompany (..)
    , HasComputedCreatedAt (..)
    , HasComputedDescription (..)
    , HasComputedEmail (..)
    , HasComputedFollowers (..)
    , HasComputedFollowing (..)
    , HasComputedGpgKeys (..)
    , HasComputedGravatarId (..)
    , HasComputedId (..)
    , HasComputedLocation (..)
    , HasComputedLogin (..)
    , HasComputedMembers (..)
    , HasComputedName (..)
    , HasComputedPermission (..)
    , HasComputedPrivacy (..)
    , HasComputedPublicGists (..)
    , HasComputedPublicRepos (..)
    , HasComputedSiteAdmin (..)
    , HasComputedSshKeys (..)
    , HasComputedUpdatedAt (..)
    ) where

import Data.Maybe (catMaybes)
import Data.Text  (Text)

import GHC.Base (Eq, ($), (.))
import GHC.Show (Show)

import Lens.Micro (Getting, Lens', lens, to)

import qualified Data.Word                 as TF
import qualified GHC.Base                  as TF
import qualified Numeric.Natural           as TF
import qualified Terrafomo.Attribute       as TF
import qualified Terrafomo.Data            as TF
import qualified Terrafomo.GitHub.Provider as TF
import qualified Terrafomo.GitHub.Types    as TF
import qualified Terrafomo.HCL             as TF
import qualified Terrafomo.IP              as TF
import qualified Terrafomo.Meta            as TF
import qualified Terrafomo.Name            as TF
import qualified Terrafomo.Resource        as TF

{- | The @github_team@ GitHub data.

Use this data source to retrieve information about a Github team.
-}
data TeamData s = TeamData {
      _slug :: !(TF.Attribute s Text)
    {- ^ (Required) The team slug. -}
    } deriving (Show, Eq)

instance TF.ToHCL (TeamData s) where
    toHCL TeamData{..} = TF.block $ catMaybes
        [ TF.attribute "slug" _slug
        ]

instance HasSlug (TeamData s) s Text where
    slug =
        lens (_slug :: TeamData s -> TF.Attribute s Text)
            (\s a -> s { _slug = a } :: TeamData s)

instance HasComputedDescription (TeamData s) Text

instance HasComputedId (TeamData s) Text

instance HasComputedMembers (TeamData s) Text

instance HasComputedName (TeamData s) Text

instance HasComputedPermission (TeamData s) Text

instance HasComputedPrivacy (TeamData s) Text

teamData :: TF.Data TF.GitHub (TeamData s)
teamData =
    TF.newData "github_team" $
        TeamData {
              _slug = TF.Nil
            }

{- | The @github_user@ GitHub data.

Use this data source to retrieve information about a Github user.
-}
data UserData s = UserData {
      _username :: !(TF.Attribute s Text)
    {- ^ (Required) The username. -}
    } deriving (Show, Eq)

instance TF.ToHCL (UserData s) where
    toHCL UserData{..} = TF.block $ catMaybes
        [ TF.attribute "username" _username
        ]

instance HasUsername (UserData s) s Text where
    username =
        lens (_username :: UserData s -> TF.Attribute s Text)
            (\s a -> s { _username = a } :: UserData s)

instance HasComputedAvatarUrl (UserData s) Text

instance HasComputedBio (UserData s) Text

instance HasComputedBlog (UserData s) Text

instance HasComputedCompany (UserData s) Text

instance HasComputedCreatedAt (UserData s) Text

instance HasComputedEmail (UserData s) Text

instance HasComputedFollowers (UserData s) Text

instance HasComputedFollowing (UserData s) Text

instance HasComputedGpgKeys (UserData s) Text

instance HasComputedGravatarId (UserData s) Text

instance HasComputedLocation (UserData s) Text

instance HasComputedLogin (UserData s) Text

instance HasComputedName (UserData s) Text

instance HasComputedPublicGists (UserData s) Text

instance HasComputedPublicRepos (UserData s) Text

instance HasComputedSiteAdmin (UserData s) Text

instance HasComputedSshKeys (UserData s) Text

instance HasComputedUpdatedAt (UserData s) Text

userData :: TF.Data TF.GitHub (UserData s)
userData =
    TF.newData "github_user" $
        UserData {
              _username = TF.Nil
            }

class HasSlug a s b | a -> s b where
    slug :: Lens' a (TF.Attribute s b)

instance HasSlug a s b => HasSlug (TF.Data p a) s b where
    slug = TF.configuration . slug

class HasUsername a s b | a -> s b where
    username :: Lens' a (TF.Attribute s b)

instance HasUsername a s b => HasUsername (TF.Data p a) s b where
    username = TF.configuration . username

class HasComputedAvatarUrl a b | a -> b where
    computedAvatarUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedAvatarUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "avatar_url")

class HasComputedBio a b | a -> b where
    computedBio
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedBio =
        to (\x -> TF.Computed (TF.referenceKey x) "bio")

class HasComputedBlog a b | a -> b where
    computedBlog
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedBlog =
        to (\x -> TF.Computed (TF.referenceKey x) "blog")

class HasComputedCompany a b | a -> b where
    computedCompany
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedCompany =
        to (\x -> TF.Computed (TF.referenceKey x) "company")

class HasComputedCreatedAt a b | a -> b where
    computedCreatedAt
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedCreatedAt =
        to (\x -> TF.Computed (TF.referenceKey x) "created_at")

class HasComputedDescription a b | a -> b where
    computedDescription
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedDescription =
        to (\x -> TF.Computed (TF.referenceKey x) "description")

class HasComputedEmail a b | a -> b where
    computedEmail
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedEmail =
        to (\x -> TF.Computed (TF.referenceKey x) "email")

class HasComputedFollowers a b | a -> b where
    computedFollowers
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedFollowers =
        to (\x -> TF.Computed (TF.referenceKey x) "followers")

class HasComputedFollowing a b | a -> b where
    computedFollowing
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedFollowing =
        to (\x -> TF.Computed (TF.referenceKey x) "following")

class HasComputedGpgKeys a b | a -> b where
    computedGpgKeys
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedGpgKeys =
        to (\x -> TF.Computed (TF.referenceKey x) "gpg_keys")

class HasComputedGravatarId a b | a -> b where
    computedGravatarId
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedGravatarId =
        to (\x -> TF.Computed (TF.referenceKey x) "gravatar_id")

class HasComputedId a b | a -> b where
    computedId
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedId =
        to (\x -> TF.Computed (TF.referenceKey x) "id")

class HasComputedLocation a b | a -> b where
    computedLocation
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedLocation =
        to (\x -> TF.Computed (TF.referenceKey x) "location")

class HasComputedLogin a b | a -> b where
    computedLogin
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedLogin =
        to (\x -> TF.Computed (TF.referenceKey x) "login")

class HasComputedMembers a b | a -> b where
    computedMembers
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedMembers =
        to (\x -> TF.Computed (TF.referenceKey x) "members")

class HasComputedName a b | a -> b where
    computedName
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedName =
        to (\x -> TF.Computed (TF.referenceKey x) "name")

class HasComputedPermission a b | a -> b where
    computedPermission
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPermission =
        to (\x -> TF.Computed (TF.referenceKey x) "permission")

class HasComputedPrivacy a b | a -> b where
    computedPrivacy
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPrivacy =
        to (\x -> TF.Computed (TF.referenceKey x) "privacy")

class HasComputedPublicGists a b | a -> b where
    computedPublicGists
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPublicGists =
        to (\x -> TF.Computed (TF.referenceKey x) "public_gists")

class HasComputedPublicRepos a b | a -> b where
    computedPublicRepos
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPublicRepos =
        to (\x -> TF.Computed (TF.referenceKey x) "public_repos")

class HasComputedSiteAdmin a b | a -> b where
    computedSiteAdmin
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSiteAdmin =
        to (\x -> TF.Computed (TF.referenceKey x) "site_admin")

class HasComputedSshKeys a b | a -> b where
    computedSshKeys
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSshKeys =
        to (\x -> TF.Computed (TF.referenceKey x) "ssh_keys")

class HasComputedUpdatedAt a b | a -> b where
    computedUpdatedAt
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedUpdatedAt =
        to (\x -> TF.Computed (TF.referenceKey x) "updated_at")