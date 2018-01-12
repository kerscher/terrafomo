{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}

module Terrafomo.Tutorial where

import Control.Monad (void)

import Data.Proxy (Proxy (Proxy))

import Terrafomo.AWS

import qualified Terrafomo.AWS.DataSource      as D
import qualified Terrafomo.AWS.Resource        as R
import qualified Terrafomo.Local.Resource      as L
import qualified Terrafomo.Template.DataSource as T

-- Observations:
--
-- * The whole Vinyl thing doesn't work with non-specified attributes.
--
-- * There is no longer the concept of a 'var', 'map', or 'index' user variable,
--   they're just haskell variables/functions with the correct type.
--
-- * Expressions (and by proxy HCL functions) only need to apply to outputs
--
-- * Output variables may need special handling similar to this previous
-- * approach for variables.

-- Questions:
--
-- * output variables
--
-- * reusing amazonka types - worth the compile time/dependency overhead?
--
-- * drop having to use a type-level name at all
--     - names should be stable + auto-generated? can this be hidden from the user?
--     -- the names need to be unique and deterministic, so ..
--
-- * answer the question 'what region is this resource being created in?' and similar.
--    have these overridable on the resource, but if they're unset then nothing is emitted.
--
-- * provider modifications via Reader.local ?
--
-- * provider aliases

-- TODO:
-- Example of using MonadTerraform homomorphism to lift into any other monad.

-- data Arch = AMD64
-- data Distro = Zesty

-- ubuntu
--     :: AWS.Region
--     -> Arch
--     -> Distro
--     -> AWS.VirtualizationType
--     -> AWS.DeviceType
--     -> AMI
-- ubuntu region arch distro virt device =
--      case (arch, distro, region, virt, device) of
--          (AMD64, Zesty, ...) -> ...

-- Equivalent to:
--
-- @
-- provider "aws" {
--   alias  = "<auto-generated>",
--   region = "eu-west-2"
-- }
-- @
-- west :: AWS
-- west = defaultAWS & region .~ "eu-west-2"

-- Equivalent to:
--
-- @
-- resource "aws_ip_ranges" "myipranges" {
--   regions = "us-west-1"
--   services = "S3"
--   depends_on = []
-- }
--
-- output "cidr_blocks" {
--   value = "${aws_ip_ranges.myipranges.cidr_blocks}"
-- }
-- @
example1 :: Terraform ()
example1 = do
    ipranges <-
        datasource "myipranges" $
            D.ipRangesDataSource
                & D.regions  .= "us-west-1"
                & D.services .= "S3"

    output "cidr_blocks" $
        attribute ipranges (Proxy @"cidr_blocks")

-- Equivalent to:
--
-- @

-- @
--
-- Mistyping an 'attribute' proxy results in the following error:
--
-- @
-- FileDataSource does not expose computed attribute "render". Supported attributes:
--     '[ '("rendered", Attr Text)
--      , '("template", Attr Text)
--      , '("vars",     Attr Text)
--      ]
-- @
example2 :: Terraform ()
example2 = do
    tmpl1 <-
        datasource "mytemplate1" $
            T.fileDataSource
                & T.template .= "foo"
                & T.vars     .~ Present "bar" -- Same as '.='

    void . resource "myfile1" $
        L.fileResource
            & L.filename .= "foo"
            & L.content  .~ attribute tmpl1 (Proxy @"rendered")
