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
-- Module      : Terrafomo.AliCloud.Resource
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.AliCloud.Resource where

import Data.Functor ((<$>))
import Data.Maybe   (catMaybes)
import Data.Text    (Text)

import GHC.Base (Eq, ($))
import GHC.Show (Show)

import qualified Terrafomo.AliCloud.Provider as TF
import qualified Terrafomo.AliCloud.Types    as TF
import qualified Terrafomo.Syntax.HCL        as TF
import qualified Terrafomo.Syntax.Resource   as TF
import qualified Terrafomo.Syntax.Resource   as TF
import qualified Terrafomo.Syntax.Variable   as TF
import qualified Terrafomo.TH                as TF

{- | The @alicloud_cdn_domain@ AliCloud resource.

Provides a CDN Accelerated Domain resource.
-}
data CdnDomainResource = CdnDomainResource {
      _cdn_type    :: !(TF.Argument Text)
    {- ^ (Required) Cdn type of the accelerated domain. Valid values are @web@ , @download@ , @video@ , @liveStream@ . -}
    , _domain_name :: !(TF.Argument Text)
    {- ^ (Required) Name of the accelerated domain. This name without suffix can have a string of 1 to 63 characters, must contain only alphanumeric characters or "-", and must not begin or end with "-", and "-" must not in the 3th and 4th character positions at the same time. Suffix @.sh@ and @.tel@ are not supported. -}
    , _scope       :: !(TF.Argument Text)
    {- ^ (Optional) Scope of the accelerated domain. Valid values are @domestic@ , @overseas@ , @global@ . Default value is @domestic@ . This parameter's setting is valid Only for the international users and domestic L3 and above users . -}
    , _source_port :: !(TF.Argument Text)
    {- ^ (Optional) Source port of the accelerated domain. Valid values are @80@ and @443@ . Default value is @80@ . You must use @80@ when the @source_type@ is @oss@ . -}
    , _source_type :: !(TF.Argument Text)
    {- ^ (Optional) Source type of the accelerated domain. Valid values are @ipaddr@ , @domain@ , @oss@ . You must set this parameter when @cdn_type@ value is not @liveStream@ . -}
    , _sources     :: !(TF.Argument Text)
    {- ^ (Optional, Type: list) Sources of the accelerated domain. It's a list of domain names or IP address and consists of at most 20 items. You must set this parameter when @cdn_type@ value is not @liveStream@ . -}
    } deriving (Show, Eq)

instance TF.ToHCL CdnDomainResource where
    toHCL CdnDomainResource{..} = TF.block $ catMaybes
        [ TF.assign "cdn_type" <$> TF.argument _cdn_type
        , TF.assign "domain_name" <$> TF.argument _domain_name
        , TF.assign "scope" <$> TF.argument _scope
        , TF.assign "source_port" <$> TF.argument _source_port
        , TF.assign "source_type" <$> TF.argument _source_type
        , TF.assign "sources" <$> TF.argument _sources
        ]

$(TF.makeSchemaLenses
    ''CdnDomainResource
    ''TF.AliCloud
    ''TF.Resource)

cdnDomainResource :: TF.Resource TF.AliCloud CdnDomainResource
cdnDomainResource =
    TF.newResource "alicloud_cdn_domain" $
        CdnDomainResource {
            _cdn_type = TF.Nil
            , _domain_name = TF.Nil
            , _scope = TF.Nil
            , _source_port = TF.Nil
            , _source_type = TF.Nil
            , _sources = TF.Nil
            }

{- | The @alicloud_container_cluster@ AliCloud resource.

Provides a container cluster resource.
-}
data ContainerClusterResource = ContainerClusterResource {
      _cidr_block          :: !(TF.Argument Text)
    {- ^ (Required, Force new resource) The CIDR block for the Container. Its valid value are @192.168.X.0/24@ or @172.16.X.0/24@ ~ @172.31.X.0/24@ , and it can't be conflict with VSwitch's. -}
    , _disk_category       :: !(TF.Argument Text)
    {- ^ - (Force new resource) The data disk category of ECS instance node. Its valid value are @cloud_ssd@ and @cloud_efficiency@ . Default to @cloud_efficiency@ . -}
    , _disk_size           :: !(TF.Argument Text)
    {- ^ - (Force new resource) The data disk size of ECS instance node. Its valid value is 20~32768 GB. Default to 20. -}
    , _image_id            :: !(TF.Argument Text)
    {- ^ - (Force new resource) The image ID of ECS instance node used. Default to System automate allocated. -}
    , _instance_type       :: !(TF.Argument Text)
    {- ^ (Required, Force new resource) The type of ECS instance node. -}
    , _name                :: !(TF.Argument Text)
    {- ^ - (Force new resource) The container cluster's name. It is the only in one Alicloud account. -}
    , _name_prefix         :: !(TF.Argument Text)
    {- ^ - (Force new resource) The container cluster name's prefix. It is conflict with @name@ . If it is specified, terraform will using it to build the only cluster name. -}
    , _password            :: !(TF.Argument Text)
    {- ^ (Required, Force new resource) The password of ECS instance node. -}
    , _size                :: !(TF.Argument Text)
    {- ^ - The ECS node number of the container cluster. Its value choices are 1~20, and default to 1. -}
    , _vswitch_id          :: !(TF.Argument Text)
    {- ^ - (Force new resource) The password of ECS instance node. If it is not specified, the container cluster's network mode will be @Classic@ . -}
    , _computed_name       :: !(TF.Attribute Text)
    {- ^ - The name of the container cluster. -}
    , _computed_size       :: !(TF.Attribute Text)
    {- ^ The ECS instance node number in the current container cluster. -}
    , _computed_vpc_id     :: !(TF.Attribute Text)
    {- ^ - The ID of VPC that current cluster launched. -}
    , _computed_vswitch_id :: !(TF.Attribute Text)
    {- ^ - The ID of VSwitch that current cluster launched. -}
    } deriving (Show, Eq)

instance TF.ToHCL ContainerClusterResource where
    toHCL ContainerClusterResource{..} = TF.block $ catMaybes
        [ TF.assign "cidr_block" <$> TF.argument _cidr_block
        , TF.assign "disk_category" <$> TF.argument _disk_category
        , TF.assign "disk_size" <$> TF.argument _disk_size
        , TF.assign "image_id" <$> TF.argument _image_id
        , TF.assign "instance_type" <$> TF.argument _instance_type
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "name_prefix" <$> TF.argument _name_prefix
        , TF.assign "password" <$> TF.argument _password
        , TF.assign "size" <$> TF.argument _size
        , TF.assign "vswitch_id" <$> TF.argument _vswitch_id
        ]

$(TF.makeSchemaLenses
    ''ContainerClusterResource
    ''TF.AliCloud
    ''TF.Resource)

containerClusterResource :: TF.Resource TF.AliCloud ContainerClusterResource
containerClusterResource =
    TF.newResource "alicloud_container_cluster" $
        ContainerClusterResource {
            _cidr_block = TF.Nil
            , _disk_category = TF.Nil
            , _disk_size = TF.Nil
            , _image_id = TF.Nil
            , _instance_type = TF.Nil
            , _name = TF.Nil
            , _name_prefix = TF.Nil
            , _password = TF.Nil
            , _size = TF.Nil
            , _vswitch_id = TF.Nil
            , _computed_name = TF.Compute "name"
            , _computed_size = TF.Compute "size"
            , _computed_vpc_id = TF.Compute "vpc_id"
            , _computed_vswitch_id = TF.Compute "vswitch_id"
            }

{- | The @alicloud_db_instance@ AliCloud resource.

Provides an RDS instance resource.  A DB instance is an isolated database
environment in the cloud.  A DB instance can contain multiple user-created
databases.
-}
data DbInstanceResource = DbInstanceResource {
      _allocate_public_connection :: !(TF.Argument Text)
    {- ^ (Optional) If set to true will applies for an Internet connection string of an instance. -}
    , _backup_retention_period    :: !(TF.Argument Text)
    {- ^ (Optional) Retention days of the backup (7 to 730 days). The default value is 7 days. -}
    , _db_instance_class          :: !(TF.Argument Text)
    {- ^ (Required) Instance type. For details, see <https://intl.aliyun.com/help/doc-detail/26312.htm?spm=a3c0i.o26228en.a3.2.bRUHF3> . -}
    , _db_instance_net_type       :: !(TF.Argument Text)
    {- ^ (Optional) Network connection type of an instance. Internet: public network; Intranet: private network -}
    , _db_instance_storage        :: !(TF.Argument Text)
    {- ^ (Required) User-defined storage space. Value range: -}
    , _db_mappings                :: !(TF.Argument Text)
    {- ^ (Optional) Database mappings to attach to db instance. See <#block-database> below for details. -}
    , _engine                     :: !(TF.Argument Text)
    {- ^ (Required) Database type. Value options: MySQL, SQLServer, PostgreSQL, and PPAS. -}
    , _engine_version             :: !(TF.Argument Text)
    {- ^ (Required) Database version. Value options: -}
    , _instance_charge_type       :: !(TF.Argument Text)
    {- ^ (Optional) Valid values are @Prepaid@ , @Postpaid@ , The default is @Postpaid@ . -}
    , _instance_network_type      :: !(TF.Argument Text)
    {- ^ (Optional) VPC: VPC instance; Classic: classic instance. If no value is specified, a classic instance will be created by default. -}
    , _master_user_name           :: !(TF.Argument Text)
    {- ^ (Optional) The master user name for the database instance. Operation account requiring a uniqueness check. It may consist of lower case letters, numbers and underlines, and must start with a letter and have no more than 16 characters. -}
    , _master_user_password       :: !(TF.Argument Text)
    {- ^ (Optional) The master password for the database instance. Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters. -}
    , _multi_az                   :: !(TF.Argument Text)
    {- ^ (Optional) Specifies if the database instance is a multiple Availability Zone deployment. -}
    , _period                     :: !(TF.Argument Text)
    {- ^ (Optional) The time that you have bought the resource, in month. Only valid when instance_charge_type is set as @PrePaid@ . Value range [1, 12]. -}
    , _preferred_backup_period    :: !(TF.Argument Text)
    {- ^ (Optional) Backup period. Values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday. -}
    , _preferred_backup_time      :: !(TF.Argument Text)
    {- ^ (Optional) Backup time, in the format ofHH:mmZ- HH:mm Z. -}
    , _security_ips               :: !(TF.Argument Text)
    {- ^ (Optional) List of IP addresses under the IP address white list array. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32]). -}
    , _vswitch_id                 :: !(TF.Argument Text)
    {- ^ (Optional) The virtual switch ID to launch in VPC. If you want to create instances in VPC network, this parameter must be set. -}
    , _zone_id                    :: !(TF.Argument Text)
    {- ^ (Optional) Selected zone to create database instance. You cannot set the ZoneId parameter if the MultiAZ parameter is set to true. -}
    } deriving (Show, Eq)

instance TF.ToHCL DbInstanceResource where
    toHCL DbInstanceResource{..} = TF.block $ catMaybes
        [ TF.assign "allocate_public_connection" <$> TF.argument _allocate_public_connection
        , TF.assign "backup_retention_period" <$> TF.argument _backup_retention_period
        , TF.assign "db_instance_class" <$> TF.argument _db_instance_class
        , TF.assign "db_instance_net_type" <$> TF.argument _db_instance_net_type
        , TF.assign "db_instance_storage" <$> TF.argument _db_instance_storage
        , TF.assign "db_mappings" <$> TF.argument _db_mappings
        , TF.assign "engine" <$> TF.argument _engine
        , TF.assign "engine_version" <$> TF.argument _engine_version
        , TF.assign "instance_charge_type" <$> TF.argument _instance_charge_type
        , TF.assign "instance_network_type" <$> TF.argument _instance_network_type
        , TF.assign "master_user_name" <$> TF.argument _master_user_name
        , TF.assign "master_user_password" <$> TF.argument _master_user_password
        , TF.assign "multi_az" <$> TF.argument _multi_az
        , TF.assign "period" <$> TF.argument _period
        , TF.assign "preferred_backup_period" <$> TF.argument _preferred_backup_period
        , TF.assign "preferred_backup_time" <$> TF.argument _preferred_backup_time
        , TF.assign "security_ips" <$> TF.argument _security_ips
        , TF.assign "vswitch_id" <$> TF.argument _vswitch_id
        , TF.assign "zone_id" <$> TF.argument _zone_id
        ]

$(TF.makeSchemaLenses
    ''DbInstanceResource
    ''TF.AliCloud
    ''TF.Resource)

dbInstanceResource :: TF.Resource TF.AliCloud DbInstanceResource
dbInstanceResource =
    TF.newResource "alicloud_db_instance" $
        DbInstanceResource {
            _allocate_public_connection = TF.Nil
            , _backup_retention_period = TF.Nil
            , _db_instance_class = TF.Nil
            , _db_instance_net_type = TF.Nil
            , _db_instance_storage = TF.Nil
            , _db_mappings = TF.Nil
            , _engine = TF.Nil
            , _engine_version = TF.Nil
            , _instance_charge_type = TF.Nil
            , _instance_network_type = TF.Nil
            , _master_user_name = TF.Nil
            , _master_user_password = TF.Nil
            , _multi_az = TF.Nil
            , _period = TF.Nil
            , _preferred_backup_period = TF.Nil
            , _preferred_backup_time = TF.Nil
            , _security_ips = TF.Nil
            , _vswitch_id = TF.Nil
            , _zone_id = TF.Nil
            }

{- | The @alicloud_disk_attachment@ AliCloud resource.

Provides an Alicloud ECS Disk Attachment as a resource, to attach and detach
disks from ECS Instances.
-}
data DiskAttachmentResource = DiskAttachmentResource {
      _disk_id              :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) ID of the Disk to be attached. -}
    , _instance_id          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) ID of the Instance to attach to. -}
    , _computed_device_name :: !(TF.Attribute Text)
    {- ^ - The device name exposed to the instance. -}
    , _computed_disk_id     :: !(TF.Attribute Text)
    {- ^ - ID of the Disk. -}
    , _computed_instance_id :: !(TF.Attribute Text)
    {- ^ - ID of the Instance. -}
    } deriving (Show, Eq)

instance TF.ToHCL DiskAttachmentResource where
    toHCL DiskAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "disk_id" <$> TF.argument _disk_id
        , TF.assign "instance_id" <$> TF.argument _instance_id
        ]

$(TF.makeSchemaLenses
    ''DiskAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

diskAttachmentResource :: TF.Resource TF.AliCloud DiskAttachmentResource
diskAttachmentResource =
    TF.newResource "alicloud_disk_attachment" $
        DiskAttachmentResource {
            _disk_id = TF.Nil
            , _instance_id = TF.Nil
            , _computed_device_name = TF.Compute "device_name"
            , _computed_disk_id = TF.Compute "disk_id"
            , _computed_instance_id = TF.Compute "instance_id"
            }

{- | The @alicloud_disk@ AliCloud resource.

Provides a ECS disk resource. ~> NOTE: One of @size@ or @snapshot_id@ is
required when specifying an ECS disk. If all of them be specified, @size@
must more than the size of snapshot which @snapshot_id@ represents.
Currently, @alicloud_disk@ doesn't resize disk.
-}
data DiskResource = DiskResource {
      _availability_zone          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The Zone to create the disk in. -}
    , _category                   :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Category of the disk. Valid values are @cloud@ , @cloud_efficiency@ and @cloud_ssd@ . Default is @cloud_efficiency@ . -}
    , _description                :: !(TF.Argument Text)
    {- ^ (Optional) Description of the disk. This description can have a string of 2 to 256 characters, It cannot begin with http:// or https://. Default value is null. -}
    , _name                       :: !(TF.Argument Text)
    {- ^ (Optional) Name of the ECS disk. This name can have a string of 2 to 128 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin or end with a hyphen, and must not begin with http:// or https://. Default value is null. -}
    , _size                       :: !(TF.Argument Text)
    {- ^ (Required) The size of the disk in GiBs, and it value range: 20 ~ 32768. -}
    , _snapshot_id                :: !(TF.Argument Text)
    {- ^ (Optional) A snapshot to base the disk off of. If it is specified, @size@ will be invalid and the disk size is equals to the snapshot size. -}
    , _tags                       :: !(TF.Argument Text)
    {- ^ (Optional) A mapping of tags to assign to the resource. -}
    , _computed_availability_zone :: !(TF.Attribute Text)
    {- ^ - The Zone to create the disk in. -}
    , _computed_category          :: !(TF.Attribute Text)
    {- ^ - The disk category. -}
    , _computed_description       :: !(TF.Attribute Text)
    {- ^ - The disk description. -}
    , _computed_id                :: !(TF.Attribute Text)
    {- ^ - The disk ID. -}
    , _computed_name              :: !(TF.Attribute Text)
    {- ^ - The disk name. -}
    , _computed_size              :: !(TF.Attribute Text)
    {- ^ - The disk size. -}
    , _computed_snapshot_id       :: !(TF.Attribute Text)
    {- ^ - The disk snapshot ID. -}
    , _computed_status            :: !(TF.Attribute Text)
    {- ^ - The disk status. -}
    , _computed_tags              :: !(TF.Attribute Text)
    {- ^ - The disk tags. -}
    } deriving (Show, Eq)

instance TF.ToHCL DiskResource where
    toHCL DiskResource{..} = TF.block $ catMaybes
        [ TF.assign "availability_zone" <$> TF.argument _availability_zone
        , TF.assign "category" <$> TF.argument _category
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "size" <$> TF.argument _size
        , TF.assign "snapshot_id" <$> TF.argument _snapshot_id
        , TF.assign "tags" <$> TF.argument _tags
        ]

$(TF.makeSchemaLenses
    ''DiskResource
    ''TF.AliCloud
    ''TF.Resource)

diskResource :: TF.Resource TF.AliCloud DiskResource
diskResource =
    TF.newResource "alicloud_disk" $
        DiskResource {
            _availability_zone = TF.Nil
            , _category = TF.Nil
            , _description = TF.Nil
            , _name = TF.Nil
            , _size = TF.Nil
            , _snapshot_id = TF.Nil
            , _tags = TF.Nil
            , _computed_availability_zone = TF.Compute "availability_zone"
            , _computed_category = TF.Compute "category"
            , _computed_description = TF.Compute "description"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_size = TF.Compute "size"
            , _computed_snapshot_id = TF.Compute "snapshot_id"
            , _computed_status = TF.Compute "status"
            , _computed_tags = TF.Compute "tags"
            }

{- | The @alicloud_dns_group@ AliCloud resource.

Provides a DNS Group resource.
-}
data DnsGroupResource = DnsGroupResource {
      _name          :: !(TF.Argument Text)
    {- ^ (Required) Name of the domain group. -}
    , _computed_id   :: !(TF.Attribute Text)
    {- ^ - The group id. -}
    , _computed_name :: !(TF.Attribute Text)
    {- ^ - The group name. -}
    } deriving (Show, Eq)

instance TF.ToHCL DnsGroupResource where
    toHCL DnsGroupResource{..} = TF.block $ catMaybes
        [ TF.assign "name" <$> TF.argument _name
        ]

$(TF.makeSchemaLenses
    ''DnsGroupResource
    ''TF.AliCloud
    ''TF.Resource)

dnsGroupResource :: TF.Resource TF.AliCloud DnsGroupResource
dnsGroupResource =
    TF.newResource "alicloud_dns_group" $
        DnsGroupResource {
            _name = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            }

{- | The @alicloud_dns@ AliCloud resource.

Provides a DNS Record resource.
-}
data DnsResource = DnsResource {
      _host_record          :: !(TF.Argument Text)
    {- ^ (Required) Host record for the domain record. This host_record can have at most 253 characters, and each part split with "." can have at most 63 characters, and must contain only alphanumeric characters or hyphens, such as "-",".","*","@",  and must not begin or end with "-". -}
    , _name                 :: !(TF.Argument Text)
    {- ^ (Required) Name of the domain. This name without suffix can have a string of 1 to 63 characters, must contain only alphanumeric characters or "-", and must not begin or end with "-", and "-" must not in the 3th and 4th character positions at the same time. Suffix @.sh@ and @.tel@ are not supported. -}
    , _priority             :: !(TF.Argument Text)
    {- ^ (Optional) The priority of domain record. Valid values are @[1-10]@ . When the @type@ is @MX@ , this parameter is required. -}
    , _routing              :: !(TF.Argument Text)
    {- ^ (Optional) The parsing line of domain record. Valid values are @default@ , @telecom@ , @unicom@ , @mobile@ , @oversea@ and @edu@ . When the @type@ is @FORWORD_URL@ , this parameter must be @default@ . Default value is @default@ . -}
    , _ttl                  :: !(TF.Argument Text)
    {- ^ (Optional) The effective time of domain record. Its scope depends on the edition of the cloud resolution. Free is @[600, 86400]@ , Basic is @[120, 86400]@ , Standard is @[60, 86400]@ , Ultimate is @[10, 86400]@ , Exclusive is @[1, 86400]@ . Default value is @600@ . -}
    , _type'                :: !(TF.Argument Text)
    {- ^ (Required) The type of domain record. Valid values are @A@ , @NS@ , @MX@ , @TXT@ , @CNAME@ , @SRV@ , @AAAA@ , @REDIRECT_URL@ and @FORWORD_URL@ . -}
    , _value                :: !(TF.Argument Text)
    {- ^ (Required) The value of domain record. -}
    , _computed_Locked      :: !(TF.Attribute Text)
    {- ^ - The record locked state. @true@ or @false@ . -}
    , _computed_host_record :: !(TF.Attribute Text)
    {- ^ - The host record of record. -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The record id. -}
    , _computed_name        :: !(TF.Attribute Text)
    {- ^ - (Required) The record domain name. -}
    , _computed_priority    :: !(TF.Attribute Text)
    {- ^ - The record priority. -}
    , _computed_routing     :: !(TF.Attribute Text)
    {- ^ - The record parsing line. -}
    , _computed_status      :: !(TF.Attribute Text)
    {- ^ - The record status. @Enable@ or @Disable@ . -}
    , _computed_ttl         :: !(TF.Attribute Text)
    {- ^ - The record effective time. -}
    , _computed_type'       :: !(TF.Attribute Text)
    {- ^ - (Required) The record type. -}
    , _computed_value       :: !(TF.Attribute Text)
    {- ^ - The record value. -}
    } deriving (Show, Eq)

instance TF.ToHCL DnsResource where
    toHCL DnsResource{..} = TF.block $ catMaybes
        [ TF.assign "host_record" <$> TF.argument _host_record
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "priority" <$> TF.argument _priority
        , TF.assign "routing" <$> TF.argument _routing
        , TF.assign "ttl" <$> TF.argument _ttl
        , TF.assign "type" <$> TF.argument _type'
        , TF.assign "value" <$> TF.argument _value
        ]

$(TF.makeSchemaLenses
    ''DnsResource
    ''TF.AliCloud
    ''TF.Resource)

dnsResource :: TF.Resource TF.AliCloud DnsResource
dnsResource =
    TF.newResource "alicloud_dns" $
        DnsResource {
            _host_record = TF.Nil
            , _name = TF.Nil
            , _priority = TF.Nil
            , _routing = TF.Nil
            , _ttl = TF.Nil
            , _type' = TF.Nil
            , _value = TF.Nil
            , _computed_Locked = TF.Compute "Locked"
            , _computed_host_record = TF.Compute "host_record"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_priority = TF.Compute "priority"
            , _computed_routing = TF.Compute "routing"
            , _computed_status = TF.Compute "status"
            , _computed_ttl = TF.Compute "ttl"
            , _computed_type' = TF.Compute "type"
            , _computed_value = TF.Compute "value"
            }

{- | The @alicloud_eip_association@ AliCloud resource.

Provides an Alicloud EIP Association resource, to associate and disassociate
Elastic IPs from ECS Instances. ~> NOTE:  @alicloud_eip_association@ is
useful in scenarios where EIPs are either pre-existing or distributed to
customers or users and therefore cannot be changed. In addition, it only
supports ECS-VPC.
-}
data EipAssociationResource = EipAssociationResource {
      _allocation_id          :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The allocation EIP ID. -}
    , _instance_id            :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The ID of the instance. -}
    , _computed_allocation_id :: !(TF.Attribute Text)
    {- ^ - As above. -}
    , _computed_instance_id   :: !(TF.Attribute Text)
    {- ^ - As above. -}
    } deriving (Show, Eq)

instance TF.ToHCL EipAssociationResource where
    toHCL EipAssociationResource{..} = TF.block $ catMaybes
        [ TF.assign "allocation_id" <$> TF.argument _allocation_id
        , TF.assign "instance_id" <$> TF.argument _instance_id
        ]

$(TF.makeSchemaLenses
    ''EipAssociationResource
    ''TF.AliCloud
    ''TF.Resource)

eipAssociationResource :: TF.Resource TF.AliCloud EipAssociationResource
eipAssociationResource =
    TF.newResource "alicloud_eip_association" $
        EipAssociationResource {
            _allocation_id = TF.Nil
            , _instance_id = TF.Nil
            , _computed_allocation_id = TF.Compute "allocation_id"
            , _computed_instance_id = TF.Compute "instance_id"
            }

{- | The @alicloud_eip@ AliCloud resource.

Provides a ECS EIP resource.
-}
data EipResource = EipResource {
      _bandwidth                     :: !(TF.Argument Text)
    {- ^ (Optional) Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second). If this value is not specified, then automatically sets it to 5 Mbps. -}
    , _internet_charge_type          :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Internet charge type of the EIP, Valid values are @PayByBandwidth@ , @PayByTraffic@ . Default is @PayByBandwidth@ . -}
    , _computed_bandwidth            :: !(TF.Attribute Text)
    {- ^ - The elastic public network bandwidth. -}
    , _computed_id                   :: !(TF.Attribute Text)
    {- ^ - The EIP ID. -}
    , _computed_internet_charge_type :: !(TF.Attribute Text)
    {- ^ - The EIP internet charge type. -}
    , _computed_ip_address           :: !(TF.Attribute Text)
    {- ^ - The elastic ip address -}
    , _computed_status               :: !(TF.Attribute Text)
    {- ^ - The EIP current status. -}
    } deriving (Show, Eq)

instance TF.ToHCL EipResource where
    toHCL EipResource{..} = TF.block $ catMaybes
        [ TF.assign "bandwidth" <$> TF.argument _bandwidth
        , TF.assign "internet_charge_type" <$> TF.argument _internet_charge_type
        ]

$(TF.makeSchemaLenses
    ''EipResource
    ''TF.AliCloud
    ''TF.Resource)

eipResource :: TF.Resource TF.AliCloud EipResource
eipResource =
    TF.newResource "alicloud_eip" $
        EipResource {
            _bandwidth = TF.Nil
            , _internet_charge_type = TF.Nil
            , _computed_bandwidth = TF.Compute "bandwidth"
            , _computed_id = TF.Compute "id"
            , _computed_internet_charge_type = TF.Compute "internet_charge_type"
            , _computed_ip_address = TF.Compute "ip_address"
            , _computed_status = TF.Compute "status"
            }

{- | The @alicloud_ess_scaling_configuration@ AliCloud resource.

Provides a ESS scaling configuration resource. ~> NOTE: Several instance
types have outdated in some regions and availability zones, such as
@ecs.t1.*@ , @ecs.s2.*@ , @ecs.n1.*@ and so on. If you want to keep them,
you should set @is_outdated@ to true. For more about the upgraded instance
type, refer to @alicloud_instance_types@ datasource.
-}
data EssScalingConfigurationResource = EssScalingConfigurationResource {
      _active                     :: !(TF.Argument Text)
    {- ^ (Optional) Whether active current scaling configuration in the specified scaling group. Default to @false@ . -}
    , _data_disk                  :: !(TF.Argument Text)
    {- ^ (Optional) DataDisk mappings to attach to ecs instance. See <#block-datadisk> below for details. -}
    , _enable                     :: !(TF.Argument Text)
    {- ^ (Optional) Whether enable the specified scaling group(make it active) to which the current scaling configuration belongs. -}
    , _force_delete               :: !(TF.Argument Text)
    {- ^ (Optional) The last scaling configuration will be deleted forcibly with deleting its scaling group. Default to false. -}
    , _image_id                   :: !(TF.Argument Text)
    {- ^ (Required) ID of an image file, indicating the image resource selected when an instance is enabled. -}
    , _instance_ids               :: !(TF.Argument Text)
    {- ^ (Optional) ID of the ECS instance to be attached to the scaling group after it is enabled. You can input up to 20 IDs. -}
    , _instance_type              :: !(TF.Argument Text)
    {- ^ (Required) Resource type of an ECS instance. -}
    , _internet_charge_type       :: !(TF.Argument Text)
    {- ^ (Optional) Network billing type, Values: PayByBandwidth or PayByTraffic. If this parameter value is not specified, the default value is PayByBandwidth. -}
    , _internet_max_bandwidth_in  :: !(TF.Argument Text)
    {- ^ (Optional) Maximum incoming bandwidth from the public network, measured in Mbps (Mega bit per second). The value range is [1,200]. -}
    , _internet_max_bandwidth_out :: !(TF.Argument Text)
    {- ^ (Optional) Maximum outgoing bandwidth from the public network, measured in Mbps (Mega bit per second). The value range for PayByBandwidth is [1,100]. -}
    , _is_outdated                :: !(TF.Argument Text)
    {- ^ (Optional) Whether to use outdated instance type. Default to false. -}
    , _key_name                   :: !(TF.Argument Text)
    {- ^ (Optional) The name of key pair that can login ECS instance successfully without password. If it is specified, the password would be invalid. -}
    , _role_name                  :: !(TF.Argument Text)
    {- ^ (Optional) Instance RAM role name. The name is provided and maintained by RAM. You can use @alicloud_ram_role@ to create a new one. -}
    , _scaling_configuration_name :: !(TF.Argument Text)
    {- ^ (Optional) Name shown for the scheduled task. If this parameter value is not specified, the default value is ScalingConfigurationId. -}
    , _scaling_group_id           :: !(TF.Argument Text)
    {- ^ (Required) ID of the scaling group of a scaling configuration. -}
    , _security_group_id          :: !(TF.Argument Text)
    {- ^ (Required) ID of the security group to which a newly created instance belongs. -}
    , _substitute                 :: !(TF.Argument Text)
    {- ^ (Optional) The another scaling configuration which will be active automatically and replace current configuration when setting @active@ to 'false'. It is invalid when @active@ is 'true' -}
    , _system_disk_category       :: !(TF.Argument Text)
    {- ^ (Optional) Category of the system disk. The parameter value options are @cloud_efficiency@ , @cloud_ssd@ and @cloud@ . @cloud@ only is used to some no I/O optimized instance. Default to @cloud_efficiency@ . -}
    , _tags                       :: !(TF.Argument Text)
    {- ^ (Optional) A mapping of tags to assign to the resource. It will be applied for ECS instances finally. -}
    , _user_data                  :: !(TF.Argument Text)
    {- ^ (Optional) User-defined data to customize the startup behaviors of the ECS instance and to pass data into the ECS instance. -}
    } deriving (Show, Eq)

instance TF.ToHCL EssScalingConfigurationResource where
    toHCL EssScalingConfigurationResource{..} = TF.block $ catMaybes
        [ TF.assign "active" <$> TF.argument _active
        , TF.assign "data_disk" <$> TF.argument _data_disk
        , TF.assign "enable" <$> TF.argument _enable
        , TF.assign "force_delete" <$> TF.argument _force_delete
        , TF.assign "image_id" <$> TF.argument _image_id
        , TF.assign "instance_ids" <$> TF.argument _instance_ids
        , TF.assign "instance_type" <$> TF.argument _instance_type
        , TF.assign "internet_charge_type" <$> TF.argument _internet_charge_type
        , TF.assign "internet_max_bandwidth_in" <$> TF.argument _internet_max_bandwidth_in
        , TF.assign "internet_max_bandwidth_out" <$> TF.argument _internet_max_bandwidth_out
        , TF.assign "is_outdated" <$> TF.argument _is_outdated
        , TF.assign "key_name" <$> TF.argument _key_name
        , TF.assign "role_name" <$> TF.argument _role_name
        , TF.assign "scaling_configuration_name" <$> TF.argument _scaling_configuration_name
        , TF.assign "scaling_group_id" <$> TF.argument _scaling_group_id
        , TF.assign "security_group_id" <$> TF.argument _security_group_id
        , TF.assign "substitute" <$> TF.argument _substitute
        , TF.assign "system_disk_category" <$> TF.argument _system_disk_category
        , TF.assign "tags" <$> TF.argument _tags
        , TF.assign "user_data" <$> TF.argument _user_data
        ]

$(TF.makeSchemaLenses
    ''EssScalingConfigurationResource
    ''TF.AliCloud
    ''TF.Resource)

essScalingConfigurationResource :: TF.Resource TF.AliCloud EssScalingConfigurationResource
essScalingConfigurationResource =
    TF.newResource "alicloud_ess_scaling_configuration" $
        EssScalingConfigurationResource {
            _active = TF.Nil
            , _data_disk = TF.Nil
            , _enable = TF.Nil
            , _force_delete = TF.Nil
            , _image_id = TF.Nil
            , _instance_ids = TF.Nil
            , _instance_type = TF.Nil
            , _internet_charge_type = TF.Nil
            , _internet_max_bandwidth_in = TF.Nil
            , _internet_max_bandwidth_out = TF.Nil
            , _is_outdated = TF.Nil
            , _key_name = TF.Nil
            , _role_name = TF.Nil
            , _scaling_configuration_name = TF.Nil
            , _scaling_group_id = TF.Nil
            , _security_group_id = TF.Nil
            , _substitute = TF.Nil
            , _system_disk_category = TF.Nil
            , _tags = TF.Nil
            , _user_data = TF.Nil
            }

{- | The @alicloud_ess_scaling_group@ AliCloud resource.

Provides a ESS scaling group resource. ~> NOTE: You can launch an ECS
instance for a VPC network via specifying parameter @vswitch_id@ . One
instance can only belong to one VSwitch.
-}
data EssScalingGroupResource = EssScalingGroupResource {
      _db_instance_ids             :: !(TF.Argument Text)
    {- ^ (Optional) If an RDS instance is specified in the scaling group, the scaling group automatically attaches the Intranet IP addresses of its ECS instances to the RDS access whitelist. -}
    , _default_cooldown            :: !(TF.Argument Text)
    {- ^ (Optional) Default cool-down time (in seconds) of the scaling group. Value range: [0, 86400]. The default value is 300s. -}
    , _loadbalancer_ids            :: !(TF.Argument Text)
    {- ^ (Optional) If a Server Load Balancer instance is specified in the scaling group, the scaling group automatically attaches its ECS instances to the Server Load Balancer instance. -}
    , _max_size                    :: !(TF.Argument Text)
    {- ^ (Required) Maximum number of ECS instances in the scaling group. Value range: [0, 100]. -}
    , _min_size                    :: !(TF.Argument Text)
    {- ^ (Required) Minimum number of ECS instances in the scaling group. Value range: [0, 100]. -}
    , _removal_policies            :: !(TF.Argument Text)
    {- ^ (Optional) RemovalPolicy is used to select the ECS instances you want to remove from the scaling group when multiple candidates for removal exist. Optional values: -}
    , _scaling_group_name          :: !(TF.Argument Text)
    {- ^ (Optional) Name shown for the scaling group, which must contain 2-40 characters (English or Chinese). If this parameter is not specified, the default value is ScalingGroupId. -}
    , _vswitch_id                  :: !(TF.Argument Text)
    {- ^ (Optional) The virtual switch ID which the ecs instance to be create in. -}
    , _computed_db_instance_ids    :: !(TF.Attribute Text)
    {- ^ - The db instance id which the ECS instance attached to. -}
    , _computed_default_cooldown   :: !(TF.Attribute Text)
    {- ^ - The default cool-down of the scaling group. -}
    , _computed_id                 :: !(TF.Attribute Text)
    {- ^ - The scaling group ID. -}
    , _computed_loadbalancer_ids   :: !(TF.Attribute Text)
    {- ^ - The slb instance id which the ECS instance attached to. -}
    , _computed_max_size           :: !(TF.Attribute Text)
    {- ^ - The maximum number of ECS instances. -}
    , _computed_min_size           :: !(TF.Attribute Text)
    {- ^ - The minimum number of ECS instances. -}
    , _computed_removal_policies   :: !(TF.Attribute Text)
    {- ^ - The removal policy used to select the ECS instance to remove from the scaling group. -}
    , _computed_scaling_group_name :: !(TF.Attribute Text)
    {- ^ - The name of the scaling group. -}
    } deriving (Show, Eq)

instance TF.ToHCL EssScalingGroupResource where
    toHCL EssScalingGroupResource{..} = TF.block $ catMaybes
        [ TF.assign "db_instance_ids" <$> TF.argument _db_instance_ids
        , TF.assign "default_cooldown" <$> TF.argument _default_cooldown
        , TF.assign "loadbalancer_ids" <$> TF.argument _loadbalancer_ids
        , TF.assign "max_size" <$> TF.argument _max_size
        , TF.assign "min_size" <$> TF.argument _min_size
        , TF.assign "removal_policies" <$> TF.argument _removal_policies
        , TF.assign "scaling_group_name" <$> TF.argument _scaling_group_name
        , TF.assign "vswitch_id" <$> TF.argument _vswitch_id
        ]

$(TF.makeSchemaLenses
    ''EssScalingGroupResource
    ''TF.AliCloud
    ''TF.Resource)

essScalingGroupResource :: TF.Resource TF.AliCloud EssScalingGroupResource
essScalingGroupResource =
    TF.newResource "alicloud_ess_scaling_group" $
        EssScalingGroupResource {
            _db_instance_ids = TF.Nil
            , _default_cooldown = TF.Nil
            , _loadbalancer_ids = TF.Nil
            , _max_size = TF.Nil
            , _min_size = TF.Nil
            , _removal_policies = TF.Nil
            , _scaling_group_name = TF.Nil
            , _vswitch_id = TF.Nil
            , _computed_db_instance_ids = TF.Compute "db_instance_ids"
            , _computed_default_cooldown = TF.Compute "default_cooldown"
            , _computed_id = TF.Compute "id"
            , _computed_loadbalancer_ids = TF.Compute "loadbalancer_ids"
            , _computed_max_size = TF.Compute "max_size"
            , _computed_min_size = TF.Compute "min_size"
            , _computed_removal_policies = TF.Compute "removal_policies"
            , _computed_scaling_group_name = TF.Compute "scaling_group_name"
            }

{- | The @alicloud_ess_scaling_rule@ AliCloud resource.

Provides a ESS scaling rule resource.
-}
data EssScalingRuleResource = EssScalingRuleResource {
      _adjustment_type            :: !(TF.Argument Text)
    {- ^ (Required) Adjustment mode of a scaling rule. Optional values: -}
    , _adjustment_value           :: !(TF.Argument Text)
    {- ^ (Required) Adjusted value of a scaling rule. Value range: -}
    , _cooldown                   :: !(TF.Argument Text)
    {- ^ (Optional) Cool-down time of a scaling rule. Value range: [0, 86,400], in seconds. The default value is empty. -}
    , _scaling_group_id           :: !(TF.Argument Text)
    {- ^ (Required) ID of the scaling group of a scaling rule. -}
    , _scaling_rule_name          :: !(TF.Argument Text)
    {- ^ (Optional) Name shown for the scaling rule, which is a string containing 2 to 40 English or Chinese characters. -}
    , _computed_adjustment_type   :: !(TF.Attribute Text)
    {- ^ - Adjustment mode of a scaling rule. -}
    , _computed_adjustment_value  :: !(TF.Attribute Text)
    {- ^ - Adjustment value of a scaling rule. -}
    , _computed_ari               :: !(TF.Attribute Text)
    {- ^ - Unique identifier of a scaling rule. -}
    , _computed_cooldown          :: !(TF.Attribute Text)
    {- ^ - Cool-down time of a scaling rule. -}
    , _computed_id                :: !(TF.Attribute Text)
    {- ^ - The scaling rule ID. -}
    , _computed_scaling_group_id  :: !(TF.Attribute Text)
    {- ^ - The id of scaling group. -}
    , _computed_scaling_rule_name :: !(TF.Attribute Text)
    {- ^ - Name of a scaling rule. -}
    } deriving (Show, Eq)

instance TF.ToHCL EssScalingRuleResource where
    toHCL EssScalingRuleResource{..} = TF.block $ catMaybes
        [ TF.assign "adjustment_type" <$> TF.argument _adjustment_type
        , TF.assign "adjustment_value" <$> TF.argument _adjustment_value
        , TF.assign "cooldown" <$> TF.argument _cooldown
        , TF.assign "scaling_group_id" <$> TF.argument _scaling_group_id
        , TF.assign "scaling_rule_name" <$> TF.argument _scaling_rule_name
        ]

$(TF.makeSchemaLenses
    ''EssScalingRuleResource
    ''TF.AliCloud
    ''TF.Resource)

essScalingRuleResource :: TF.Resource TF.AliCloud EssScalingRuleResource
essScalingRuleResource =
    TF.newResource "alicloud_ess_scaling_rule" $
        EssScalingRuleResource {
            _adjustment_type = TF.Nil
            , _adjustment_value = TF.Nil
            , _cooldown = TF.Nil
            , _scaling_group_id = TF.Nil
            , _scaling_rule_name = TF.Nil
            , _computed_adjustment_type = TF.Compute "adjustment_type"
            , _computed_adjustment_value = TF.Compute "adjustment_value"
            , _computed_ari = TF.Compute "ari"
            , _computed_cooldown = TF.Compute "cooldown"
            , _computed_id = TF.Compute "id"
            , _computed_scaling_group_id = TF.Compute "scaling_group_id"
            , _computed_scaling_rule_name = TF.Compute "scaling_rule_name"
            }

{- | The @alicloud_ess_schedule@ AliCloud resource.

Provides a ESS schedule resource.
-}
data EssScheduleResource = EssScheduleResource {
      _description                  :: !(TF.Argument Text)
    {- ^ (Optional) Description of the scheduled task, which is 2-200 characters (English or Chinese) long. -}
    , _launch_expiration_time       :: !(TF.Argument Text)
    {- ^ (Optional) Time period within which the failed scheduled task is retried. The default value is 600s. Value range: [0, 21600] -}
    , _launch_time                  :: !(TF.Argument Text)
    {- ^ (Required) Operations performed when the scheduled task is triggered. Fill in the unique identifier of the scaling rule. -}
    , _recurrence_end_time          :: !(TF.Argument Text)
    {- ^ (Optional) End time of the scheduled task to be repeated. The date format follows the ISO8601 standard and uses UTC time. It is in the format of YYYY-MM-DDThh:mmZ. A time point 90 days after creation or modification cannot be entered. RecurrenceType, RecurrenceValue and RecurrenceEndTime must be specified. -}
    , _recurrence_type              :: !(TF.Argument Text)
    {- ^ (Optional) Type of the scheduled task to be repeated. RecurrenceType, RecurrenceValue and RecurrenceEndTime must be specified. Optional values: -}
    , _recurrence_value             :: !(TF.Argument Text)
    {- ^ (Optional) Value of the scheduled task to be repeated. RecurrenceType, RecurrenceValue and RecurrenceEndTime must be specified. -}
    , _scheduled_action             :: !(TF.Argument Text)
    {- ^ (Required) Operations performed when the scheduled task is triggered. Fill in the unique identifier of the scaling rule. -}
    , _scheduled_task_name          :: !(TF.Argument Text)
    {- ^ (Optional) Display name of the scheduled task, which must be 2-40 characters (English or Chinese) long. -}
    , _task_enabled                 :: !(TF.Argument Text)
    {- ^ (Optional) Whether to enable the scheduled task. The default value is true. -}
    , _computed_description         :: !(TF.Attribute Text)
    {- ^ - The description of schedule task. -}
    , _computed_id                  :: !(TF.Attribute Text)
    {- ^ - The schedule task ID. -}
    , _computed_launch_time         :: !(TF.Attribute Text)
    {- ^ - The time of schedule task be triggered. -}
    , _computed_scheduled_action    :: !(TF.Attribute Text)
    {- ^ - The action of schedule task. -}
    , _computed_scheduled_task_name :: !(TF.Attribute Text)
    {- ^ - The name of schedule task. -}
    , _computed_task_enabled        :: !(TF.Attribute Text)
    {- ^ - Wether the task is enabled. -}
    } deriving (Show, Eq)

instance TF.ToHCL EssScheduleResource where
    toHCL EssScheduleResource{..} = TF.block $ catMaybes
        [ TF.assign "description" <$> TF.argument _description
        , TF.assign "launch_expiration_time" <$> TF.argument _launch_expiration_time
        , TF.assign "launch_time" <$> TF.argument _launch_time
        , TF.assign "recurrence_end_time" <$> TF.argument _recurrence_end_time
        , TF.assign "recurrence_type" <$> TF.argument _recurrence_type
        , TF.assign "recurrence_value" <$> TF.argument _recurrence_value
        , TF.assign "scheduled_action" <$> TF.argument _scheduled_action
        , TF.assign "scheduled_task_name" <$> TF.argument _scheduled_task_name
        , TF.assign "task_enabled" <$> TF.argument _task_enabled
        ]

$(TF.makeSchemaLenses
    ''EssScheduleResource
    ''TF.AliCloud
    ''TF.Resource)

essScheduleResource :: TF.Resource TF.AliCloud EssScheduleResource
essScheduleResource =
    TF.newResource "alicloud_ess_schedule" $
        EssScheduleResource {
            _description = TF.Nil
            , _launch_expiration_time = TF.Nil
            , _launch_time = TF.Nil
            , _recurrence_end_time = TF.Nil
            , _recurrence_type = TF.Nil
            , _recurrence_value = TF.Nil
            , _scheduled_action = TF.Nil
            , _scheduled_task_name = TF.Nil
            , _task_enabled = TF.Nil
            , _computed_description = TF.Compute "description"
            , _computed_id = TF.Compute "id"
            , _computed_launch_time = TF.Compute "launch_time"
            , _computed_scheduled_action = TF.Compute "scheduled_action"
            , _computed_scheduled_task_name = TF.Compute "scheduled_task_name"
            , _computed_task_enabled = TF.Compute "task_enabled"
            }

{- | The @alicloud_forward@ AliCloud resource.

Provides a forward resource.
-}
data ForwardResource = ForwardResource {
      _external_ip      :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The external ip address, the ip must along bandwidth package public ip which @alicloud_nat_gateway@ argument @bandwidth_packages@ . -}
    , _external_port    :: !(TF.Argument Text)
    {- ^ (Required) The external port, valid value is 1~65535|any. -}
    , _forward_table_id :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The value can get from @alicloud_nat_gateway@ Attributes "forward_table_ids". -}
    , _internal_ip      :: !(TF.Argument Text)
    {- ^ (Required) The internal ip, must a private ip. -}
    , _internal_port    :: !(TF.Argument Text)
    {- ^ (Required) The internal port, valid value is 1~65535|any. -}
    , _ip_protocol      :: !(TF.Argument Text)
    {- ^ (Required) The ip protocal, valid value is tcp|udp|any. -}
    } deriving (Show, Eq)

instance TF.ToHCL ForwardResource where
    toHCL ForwardResource{..} = TF.block $ catMaybes
        [ TF.assign "external_ip" <$> TF.argument _external_ip
        , TF.assign "external_port" <$> TF.argument _external_port
        , TF.assign "forward_table_id" <$> TF.argument _forward_table_id
        , TF.assign "internal_ip" <$> TF.argument _internal_ip
        , TF.assign "internal_port" <$> TF.argument _internal_port
        , TF.assign "ip_protocol" <$> TF.argument _ip_protocol
        ]

$(TF.makeSchemaLenses
    ''ForwardResource
    ''TF.AliCloud
    ''TF.Resource)

forwardResource :: TF.Resource TF.AliCloud ForwardResource
forwardResource =
    TF.newResource "alicloud_forward" $
        ForwardResource {
            _external_ip = TF.Nil
            , _external_port = TF.Nil
            , _forward_table_id = TF.Nil
            , _internal_ip = TF.Nil
            , _internal_port = TF.Nil
            , _ip_protocol = TF.Nil
            }

{- | The @alicloud_instance@ AliCloud resource.

Provides a ECS instance resource. ~> NOTE: You can launch an ECS instance
for a VPC network via specifying parameter @vswitch_id@ . One instance can
only belong to one VSwitch. ~> NOTE: If a VSwitchId is specified for
creating an instance, SecurityGroupId and VSwitchId must belong to one VPC.
~> NOTE: Several instance types have outdated in some regions and
availability zones, such as @ecs.t1.*@ , @ecs.s2.*@ , @ecs.n1.*@ and so on.
If you want to keep them, you should set @is_outdated@ to true. For more
about the upgraded instance type, refer to @alicloud_instance_types@
datasource.
-}
data InstanceResource = InstanceResource {
      _allocate_public_ip         :: !(TF.Argument Text)
    {- ^ (Optional) Associate a public ip address with an instance in a VPC or Classic. Boolean value, Default is false. -}
    , _availability_zone          :: !(TF.Argument Text)
    {- ^ (Optional) The Zone to start the instance in. -}
    , _description                :: !(TF.Argument Text)
    {- ^ (Optional) Description of the instance, This description can have a string of 2 to 256 characters, It cannot begin with http:// or https://. Default value is null. -}
    , _host_name                  :: !(TF.Argument Text)
    {- ^ (Optional) Host name of the ECS, which is a string of at least two characters. “hostname” cannot start or end with “.” or “-“. In addition, two or more consecutive “.” or “-“ symbols are not allowed. On Windows, the host name can contain a maximum of 15 characters, which can be a combination of uppercase/lowercase letters, numerals, and “-“. The host name cannot contain dots (“.”) or contain only numeric characters. On other OSs such as Linux, the host name can contain a maximum of 30 characters, which can be segments separated by dots (“.”), where each segment can contain uppercase/lowercase letters, numerals, or “_“. -}
    , _image_id                   :: !(TF.Argument Text)
    {- ^ (Required) The Image to use for the instance. ECS instance's image can be replaced via changing 'image_id'. -}
    , _instance_charge_type       :: !(TF.Argument Text)
    {- ^ (Optional) Valid values are @PrePaid@ , @PostPaid@ , The default is @PostPaid@ . -}
    , _instance_name              :: !(TF.Argument Text)
    {- ^ (Optional) The name of the ECS. This instance_name can have a string of 2 to 128 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin or end with a hyphen, and must not begin with http:// or https://. If not specified, Terraform will autogenerate a default name is @ECS-Instance@ . -}
    , _instance_type              :: !(TF.Argument Text)
    {- ^ (Required) The type of instance to start. -}
    , _internet_charge_type       :: !(TF.Argument Text)
    {- ^ (Optional) Internet charge type of the instance, Valid values are @PayByBandwidth@ , @PayByTraffic@ . Default is @PayByTraffic@ . -}
    , _internet_max_bandwidth_in  :: !(TF.Argument Text)
    {- ^ (Optional) Maximum incoming bandwidth from the public network, measured in Mbps (Mega bit per second). Value range: [1, 200]. If this value is not specified, then automatically sets it to 200 Mbps. -}
    , _internet_max_bandwidth_out :: !(TF.Argument Text)
    {- ^ (Optional) Maximum outgoing bandwidth to the public network, measured in Mbps (Mega bit per second). Value range:  [0, 100], If this value is not specified, then automatically sets it to 0 Mbps. -}
    , _is_outdated                :: !(TF.Argument Text)
    {- ^ (Optional) Whether to use outdated instance type. Default to false. -}
    , _key_name                   :: !(TF.Argument Text)
    {- ^ (Optional, Force new resource) The name of key pair that can login ECS instance successfully without password. If it is specified, the password would be invalid. -}
    , _password                   :: !(TF.Argument Text)
    {- ^ (Optional) Password to an instance is a string of 8 to 30 characters. It must contain uppercase/lowercase letters and numerals, but cannot contain special symbols. In order to take effect new password, the instance will be restarted after modifying the password. -}
    , _period                     :: !(TF.Argument Text)
    {- ^ (Optional) The time that you have bought the resource, in month. Only valid when instance_charge_type is set as @PrePaid@ . Value range [1, 12]. -}
    , _role_name                  :: !(TF.Argument Text)
    {- ^ (Optional, Force new resource) Instance RAM role name. The name is provided and maintained by RAM. You can use @alicloud_ram_role@ to create a new one. -}
    , _security_groups            :: !(TF.Argument Text)
    {- ^ (Required)  A list of security group ids to associate with. -}
    , _system_disk_category       :: !(TF.Argument Text)
    {- ^ (Optional) Valid values are @cloud_efficiency@ , @cloud_ssd@ and @cloud@ . @cloud@ only is used to some none I/O optimized instance. Default to @cloud_efficiency@ . -}
    , _system_disk_size           :: !(TF.Argument Text)
    {- ^ (Optional) Size of the system disk, value range: 40GB ~ 500GB. Default is 40GB. ECS instance's system disk can be reset when replacing system disk. -}
    , _tags                       :: !(TF.Argument Text)
    {- ^ (Optional) A mapping of tags to assign to the resource. -}
    , _user_data                  :: !(TF.Argument Text)
    {- ^ (Optional) User-defined data to customize the startup behaviors of an ECS instance and to pass data into an ECS instance. -}
    , _vswitch_id                 :: !(TF.Argument Text)
    {- ^ (Optional) The virtual switch ID to launch in VPC. If you want to create instances in VPC network, this parameter must be set. -}
    , _computed_availability_zone :: !(TF.Attribute Text)
    {- ^ - The Zone to start the instance in. -}
    , _computed_description       :: !(TF.Attribute Text)
    {- ^ - The instance description. -}
    , _computed_host_name         :: !(TF.Attribute Text)
    {- ^ - The instance host name. -}
    , _computed_id                :: !(TF.Attribute Text)
    {- ^ - The instance ID. -}
    , _computed_image_id          :: !(TF.Attribute Text)
    {- ^ - The instance Image Id. -}
    , _computed_instance_name     :: !(TF.Attribute Text)
    {- ^ - The instance name. -}
    , _computed_instance_type     :: !(TF.Attribute Text)
    {- ^ - The instance type. -}
    , _computed_key_name          :: !(TF.Attribute Text)
    {- ^ - The name of key pair that has been bound in ECS instance. -}
    , _computed_private_ip        :: !(TF.Attribute Text)
    {- ^ - The instance private ip. -}
    , _computed_public_ip         :: !(TF.Attribute Text)
    {- ^ - The instance public ip. -}
    , _computed_role_name         :: !(TF.Attribute Text)
    {- ^ - The name of RAM role that has been bound in ECS instance. -}
    , _computed_status            :: !(TF.Attribute Text)
    {- ^ - The instance status. -}
    , _computed_tags              :: !(TF.Attribute Text)
    {- ^ - The instance tags, use jsonencode(item) to display the value. -}
    , _computed_user_data         :: !(TF.Attribute Text)
    {- ^ - The hash value of the user data. -}
    , _computed_vswitch_id        :: !(TF.Attribute Text)
    {- ^ - If the instance created in VPC, then this value is  virtual switch ID. -}
    } deriving (Show, Eq)

instance TF.ToHCL InstanceResource where
    toHCL InstanceResource{..} = TF.block $ catMaybes
        [ TF.assign "allocate_public_ip" <$> TF.argument _allocate_public_ip
        , TF.assign "availability_zone" <$> TF.argument _availability_zone
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "host_name" <$> TF.argument _host_name
        , TF.assign "image_id" <$> TF.argument _image_id
        , TF.assign "instance_charge_type" <$> TF.argument _instance_charge_type
        , TF.assign "instance_name" <$> TF.argument _instance_name
        , TF.assign "instance_type" <$> TF.argument _instance_type
        , TF.assign "internet_charge_type" <$> TF.argument _internet_charge_type
        , TF.assign "internet_max_bandwidth_in" <$> TF.argument _internet_max_bandwidth_in
        , TF.assign "internet_max_bandwidth_out" <$> TF.argument _internet_max_bandwidth_out
        , TF.assign "is_outdated" <$> TF.argument _is_outdated
        , TF.assign "key_name" <$> TF.argument _key_name
        , TF.assign "password" <$> TF.argument _password
        , TF.assign "period" <$> TF.argument _period
        , TF.assign "role_name" <$> TF.argument _role_name
        , TF.assign "security_groups" <$> TF.argument _security_groups
        , TF.assign "system_disk_category" <$> TF.argument _system_disk_category
        , TF.assign "system_disk_size" <$> TF.argument _system_disk_size
        , TF.assign "tags" <$> TF.argument _tags
        , TF.assign "user_data" <$> TF.argument _user_data
        , TF.assign "vswitch_id" <$> TF.argument _vswitch_id
        ]

$(TF.makeSchemaLenses
    ''InstanceResource
    ''TF.AliCloud
    ''TF.Resource)

instanceResource :: TF.Resource TF.AliCloud InstanceResource
instanceResource =
    TF.newResource "alicloud_instance" $
        InstanceResource {
            _allocate_public_ip = TF.Nil
            , _availability_zone = TF.Nil
            , _description = TF.Nil
            , _host_name = TF.Nil
            , _image_id = TF.Nil
            , _instance_charge_type = TF.Nil
            , _instance_name = TF.Nil
            , _instance_type = TF.Nil
            , _internet_charge_type = TF.Nil
            , _internet_max_bandwidth_in = TF.Nil
            , _internet_max_bandwidth_out = TF.Nil
            , _is_outdated = TF.Nil
            , _key_name = TF.Nil
            , _password = TF.Nil
            , _period = TF.Nil
            , _role_name = TF.Nil
            , _security_groups = TF.Nil
            , _system_disk_category = TF.Nil
            , _system_disk_size = TF.Nil
            , _tags = TF.Nil
            , _user_data = TF.Nil
            , _vswitch_id = TF.Nil
            , _computed_availability_zone = TF.Compute "availability_zone"
            , _computed_description = TF.Compute "description"
            , _computed_host_name = TF.Compute "host_name"
            , _computed_id = TF.Compute "id"
            , _computed_image_id = TF.Compute "image_id"
            , _computed_instance_name = TF.Compute "instance_name"
            , _computed_instance_type = TF.Compute "instance_type"
            , _computed_key_name = TF.Compute "key_name"
            , _computed_private_ip = TF.Compute "private_ip"
            , _computed_public_ip = TF.Compute "public_ip"
            , _computed_role_name = TF.Compute "role_name"
            , _computed_status = TF.Compute "status"
            , _computed_tags = TF.Compute "tags"
            , _computed_user_data = TF.Compute "user_data"
            , _computed_vswitch_id = TF.Compute "vswitch_id"
            }

{- | The @alicloud_key_pair_attachment@ AliCloud resource.

Provides a key pair attachment resource to bind key pair for several ECS
instances.
-}
data KeyPairAttachmentResource = KeyPairAttachmentResource {
      _instance_ids          :: !(TF.Argument Text)
    {- ^ (Required, Force new resource) The list of ECS instance's IDs. -}
    , _key_name              :: !(TF.Argument Text)
    {- ^ (Required, Force new resource) The name of key pair used to bind. -}
    , _computed_instance_ids :: !(TF.Attribute Text)
    {- ^ The list of ECS instance's IDs. -}
    , _computed_key_name     :: !(TF.Attribute Text)
    {- ^ - The name of the key pair. -}
    } deriving (Show, Eq)

instance TF.ToHCL KeyPairAttachmentResource where
    toHCL KeyPairAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "instance_ids" <$> TF.argument _instance_ids
        , TF.assign "key_name" <$> TF.argument _key_name
        ]

$(TF.makeSchemaLenses
    ''KeyPairAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

keyPairAttachmentResource :: TF.Resource TF.AliCloud KeyPairAttachmentResource
keyPairAttachmentResource =
    TF.newResource "alicloud_key_pair_attachment" $
        KeyPairAttachmentResource {
            _instance_ids = TF.Nil
            , _key_name = TF.Nil
            , _computed_instance_ids = TF.Compute "instance_ids"
            , _computed_key_name = TF.Compute "key_name"
            }

{- | The @alicloud_key_pair@ AliCloud resource.

Provides a key pair resource.
-}
data KeyPairResource = KeyPairResource {
      _key_file             :: !(TF.Argument Text)
    {- ^ - (Force new resource) The name of file to save your new key pair's private key. Strongly suggest you to specified it when you creating key pair, otherwise, you wouldn't get its private key ever. -}
    , _key_name             :: !(TF.Argument Text)
    {- ^ - (Force new resource) The key pair's name. It is the only in one Alicloud account. -}
    , _key_name_prefix      :: !(TF.Argument Text)
    {- ^ - (Force new resource) The key pair name's prefix. It is conflict with @key_name@ . If it is specified, terraform will using it to build the only key name. -}
    , _public_key           :: !(TF.Argument Text)
    {- ^ - (Force new resource) You can import an existing public key and using Alicloud key pair to manage it. -}
    , _computed_fingerprint :: !(TF.Attribute Text)
    {- ^ The finger print of the key pair. -}
    , _computed_key_name    :: !(TF.Attribute Text)
    {- ^ - The name of the key pair. -}
    } deriving (Show, Eq)

instance TF.ToHCL KeyPairResource where
    toHCL KeyPairResource{..} = TF.block $ catMaybes
        [ TF.assign "key_file" <$> TF.argument _key_file
        , TF.assign "key_name" <$> TF.argument _key_name
        , TF.assign "key_name_prefix" <$> TF.argument _key_name_prefix
        , TF.assign "public_key" <$> TF.argument _public_key
        ]

$(TF.makeSchemaLenses
    ''KeyPairResource
    ''TF.AliCloud
    ''TF.Resource)

keyPairResource :: TF.Resource TF.AliCloud KeyPairResource
keyPairResource =
    TF.newResource "alicloud_key_pair" $
        KeyPairResource {
            _key_file = TF.Nil
            , _key_name = TF.Nil
            , _key_name_prefix = TF.Nil
            , _public_key = TF.Nil
            , _computed_fingerprint = TF.Compute "fingerprint"
            , _computed_key_name = TF.Compute "key_name"
            }

{- | The @alicloud_nat_gateway@ AliCloud resource.

Provides a resource to create a VPC NAT Gateway. ~> NOTE:
alicloud_nat_gateway must depends on alicloud_vswitch.
-}
data NatGatewayResource = NatGatewayResource {
      _bandwidth_packages :: !(TF.Argument Text)
    {- ^ (Required) A list of bandwidth packages for the nat gatway. -}
    , _description        :: !(TF.Argument Text)
    {- ^ (Optional) Description of the nat gateway, This description can have a string of 2 to 256 characters, It cannot begin with http:// or https://. Defaults to null. -}
    , _name               :: !(TF.Argument Text)
    {- ^ (Optional) Name of the nat gateway. The value can have a string of 2 to 128 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin or end with a hyphen, and must not begin with http:// or https://. Defaults to null. -}
    , _spec               :: !(TF.Argument Text)
    {- ^ (Required, Forces New Resorce) The specification of the nat gateway. Valid values are @Small@ , @Middle@ and @Large@ . Details refer to <https://help.aliyun.com/document_detail/42757.html?spm=5176.doc32322.6.559.kFNBzv> -}
    , _vpc_id             :: !(TF.Argument Text)
    {- ^ (Required, Forces New Resorce) The VPC ID. -}
    } deriving (Show, Eq)

instance TF.ToHCL NatGatewayResource where
    toHCL NatGatewayResource{..} = TF.block $ catMaybes
        [ TF.assign "bandwidth_packages" <$> TF.argument _bandwidth_packages
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "spec" <$> TF.argument _spec
        , TF.assign "vpc_id" <$> TF.argument _vpc_id
        ]

$(TF.makeSchemaLenses
    ''NatGatewayResource
    ''TF.AliCloud
    ''TF.Resource)

natGatewayResource :: TF.Resource TF.AliCloud NatGatewayResource
natGatewayResource =
    TF.newResource "alicloud_nat_gateway" $
        NatGatewayResource {
            _bandwidth_packages = TF.Nil
            , _description = TF.Nil
            , _name = TF.Nil
            , _spec = TF.Nil
            , _vpc_id = TF.Nil
            }

{- | The @alicloud_oss_bucket_object@ AliCloud resource.

Provides a resource to put a object(content or file) to a oss bucket.
-}
data OssBucketObjectResource = OssBucketObjectResource {
      _acl                     :: !(TF.Argument Text)
    {- ^ (Optional) The <https://help.aliyun.com/document_detail/31843.html?spm=5176.doc31842.2.2.j7C2nn> to apply. Defaults to "private". -}
    , _bucket                  :: !(TF.Argument Text)
    {- ^ (Required) The name of the bucket to put the file in. -}
    , _cache_control           :: !(TF.Argument Text)
    {- ^ (Optional) Specifies caching behavior along the request/reply chain. Read <https://www.ietf.org/rfc/rfc2616.txt?spm=5176.doc31978.2.1.iLEoOM&file=rfc2616.txt> for further details. -}
    , _content                 :: !(TF.Argument Text)
    {- ^ (Required unless @source@ given) The literal content being uploaded to the bucket. -}
    , _content_disposition     :: !(TF.Argument Text)
    {- ^ (Optional) Specifies presentational information for the object. Read <https://www.ietf.org/rfc/rfc2616.txt?spm=5176.doc31978.2.1.iLEoOM&file=rfc2616.txt> for further details. -}
    , _content_encoding        :: !(TF.Argument Text)
    {- ^ (Optional) Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. Read <https://www.ietf.org/rfc/rfc2616.txt?spm=5176.doc31978.2.1.iLEoOM&file=rfc2616.txt> for further details. -}
    , _content_md5             :: !(TF.Argument Text)
    {- ^ (Optional) The MD5 value of the content. Read <https://help.aliyun.com/document_detail/31978.html?spm=5176.product31815.6.861.upTmI0> for computing method. -}
    , _content_type            :: !(TF.Argument Text)
    {- ^ (Optional) A standard MIME type describing the format of the object data, e.g. application/octet-stream. All Valid MIME Types are valid for this input. -}
    , _expires                 :: !(TF.Argument Text)
    {- ^ (Optional) Specifies expire date for the the request/response. Read <https://www.ietf.org/rfc/rfc2616.txt?spm=5176.doc31978.2.1.iLEoOM&file=rfc2616.txt> for further details. -}
    , _key                     :: !(TF.Argument Text)
    {- ^ (Required) The name of the object once it is in the bucket. -}
    , _server_side_encryption  :: !(TF.Argument Text)
    {- ^ (Optional) Specifies server-side encryption of the object in OSS. At present, it valid value is " @AES256@ ". -}
    , _source                  :: !(TF.Argument Text)
    {- ^ (Required) The path to the source file being uploaded to the bucket. -}
    , _computed_content_length :: !(TF.Attribute Text)
    {- ^ - the content length of request. -}
    , _computed_etag           :: !(TF.Attribute Text)
    {- ^ - the ETag generated for the object (an MD5 sum of the object content). -}
    , _computed_id             :: !(TF.Attribute Text)
    {- ^ - the @key@ of the resource supplied above -}
    } deriving (Show, Eq)

instance TF.ToHCL OssBucketObjectResource where
    toHCL OssBucketObjectResource{..} = TF.block $ catMaybes
        [ TF.assign "acl" <$> TF.argument _acl
        , TF.assign "bucket" <$> TF.argument _bucket
        , TF.assign "cache_control" <$> TF.argument _cache_control
        , TF.assign "content" <$> TF.argument _content
        , TF.assign "content_disposition" <$> TF.argument _content_disposition
        , TF.assign "content_encoding" <$> TF.argument _content_encoding
        , TF.assign "content_md5" <$> TF.argument _content_md5
        , TF.assign "content_type" <$> TF.argument _content_type
        , TF.assign "expires" <$> TF.argument _expires
        , TF.assign "key" <$> TF.argument _key
        , TF.assign "server_side_encryption" <$> TF.argument _server_side_encryption
        , TF.assign "source" <$> TF.argument _source
        ]

$(TF.makeSchemaLenses
    ''OssBucketObjectResource
    ''TF.AliCloud
    ''TF.Resource)

ossBucketObjectResource :: TF.Resource TF.AliCloud OssBucketObjectResource
ossBucketObjectResource =
    TF.newResource "alicloud_oss_bucket_object" $
        OssBucketObjectResource {
            _acl = TF.Nil
            , _bucket = TF.Nil
            , _cache_control = TF.Nil
            , _content = TF.Nil
            , _content_disposition = TF.Nil
            , _content_encoding = TF.Nil
            , _content_md5 = TF.Nil
            , _content_type = TF.Nil
            , _expires = TF.Nil
            , _key = TF.Nil
            , _server_side_encryption = TF.Nil
            , _source = TF.Nil
            , _computed_content_length = TF.Compute "content_length"
            , _computed_etag = TF.Compute "etag"
            , _computed_id = TF.Compute "id"
            }

{- | The @alicloud_oss_bucket@ AliCloud resource.

Provides a resource to create a oss bucket and set its attribution. ~> NOTE:
The bucket namespace is shared by all users of the OSS system. Please set
bucket name as unique as possible.
-}
data OssBucketResource = OssBucketResource {
      _acl              :: !(TF.Argument Text)
    {- ^ (Optional) The <https://help.aliyun.com/document_detail/31843.html?spm=5176.doc31842.2.2.j7C2nn> to apply. Defaults to "private". -}
    , _bucket           :: !(TF.Argument Text)
    {- ^ (Optional, Forces New Resorce) The name of the bucket. If omitted, Terraform will assign a random and unique name. -}
    , _core_rule        :: !(TF.Argument Text)
    {- ^ (Optional) A rule of <https://help.aliyun.com/document_detail/32001.html?spm=5176.doc32000.6.886.Hd5dYP> (documented below). The items of core rule are no more than 10 for every OSS bucket. -}
    , _lifecycle_rule   :: !(TF.Argument Text)
    {- ^ (Optional) A configuration of <https://help.aliyun.com/document_detail/31964.html?spm=5176.doc31869.6.846.ZxpE3x> (documented below). -}
    , _logging          :: !(TF.Argument Text)
    {- ^ (Optional) A Settings of <https://help.aliyun.com/document_detail/31961.html?spm=5176.doc31868.2.4.jjuG5O> (documented below). -}
    , _logging_isenable :: !(TF.Argument Text)
    {- ^ (Optional) The flag of using logging enable container. Defaults true. -}
    , _referer_config   :: !(TF.Argument Text)
    {- ^ (Optional) The configuration of <https://help.aliyun.com/document_detail/31869.html?spm=5176.doc31963.2.2.a3LZzH> (documented below). -}
    , _website          :: !(TF.Argument Text)
    {- ^ (Optional) A website object(documented below). -}
    } deriving (Show, Eq)

instance TF.ToHCL OssBucketResource where
    toHCL OssBucketResource{..} = TF.block $ catMaybes
        [ TF.assign "acl" <$> TF.argument _acl
        , TF.assign "bucket" <$> TF.argument _bucket
        , TF.assign "core_rule" <$> TF.argument _core_rule
        , TF.assign "lifecycle_rule" <$> TF.argument _lifecycle_rule
        , TF.assign "logging" <$> TF.argument _logging
        , TF.assign "logging_isenable" <$> TF.argument _logging_isenable
        , TF.assign "referer_config" <$> TF.argument _referer_config
        , TF.assign "website" <$> TF.argument _website
        ]

$(TF.makeSchemaLenses
    ''OssBucketResource
    ''TF.AliCloud
    ''TF.Resource)

ossBucketResource :: TF.Resource TF.AliCloud OssBucketResource
ossBucketResource =
    TF.newResource "alicloud_oss_bucket" $
        OssBucketResource {
            _acl = TF.Nil
            , _bucket = TF.Nil
            , _core_rule = TF.Nil
            , _lifecycle_rule = TF.Nil
            , _logging = TF.Nil
            , _logging_isenable = TF.Nil
            , _referer_config = TF.Nil
            , _website = TF.Nil
            }

{- | The @alicloud_ram_access_key@ AliCloud resource.

Provides a RAM User access key resource. ~> NOTE: You should set the
@secret_file@ if you want to get the access key.
-}
data RamAccessKeyResource = RamAccessKeyResource {
      _secret_file     :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The name of file that can save access key id and access key secret. Strongly suggest you to specified it when you creating access key, otherwise, you wouldn't get its secret ever. -}
    , _status          :: !(TF.Argument Text)
    {- ^ (Optional) Status of access key. It must be @Active@ or @Inactive@ . Default value is @Active@ . -}
    , _user_name       :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM user. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin with a hyphen. -}
    , _computed_id     :: !(TF.Attribute Text)
    {- ^ - The access key ID. -}
    , _computed_status :: !(TF.Attribute Text)
    {- ^ - The access key status. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamAccessKeyResource where
    toHCL RamAccessKeyResource{..} = TF.block $ catMaybes
        [ TF.assign "secret_file" <$> TF.argument _secret_file
        , TF.assign "status" <$> TF.argument _status
        , TF.assign "user_name" <$> TF.argument _user_name
        ]

$(TF.makeSchemaLenses
    ''RamAccessKeyResource
    ''TF.AliCloud
    ''TF.Resource)

ramAccessKeyResource :: TF.Resource TF.AliCloud RamAccessKeyResource
ramAccessKeyResource =
    TF.newResource "alicloud_ram_access_key" $
        RamAccessKeyResource {
            _secret_file = TF.Nil
            , _status = TF.Nil
            , _user_name = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_status = TF.Compute "status"
            }

{- | The @alicloud_ram_account_alias@ AliCloud resource.

Provides a RAM cloud account alias.
-}
data RamAccountAliasResource = RamAccountAliasResource {
      _account_alias          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Alias of cloud account. This name can have a string of 3 to 32 characters, must contain only alphanumeric characters or hyphens, such as "-", and must not begin with a hyphen. -}
    , _computed_account_alias :: !(TF.Attribute Text)
    {- ^ - The account alias. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamAccountAliasResource where
    toHCL RamAccountAliasResource{..} = TF.block $ catMaybes
        [ TF.assign "account_alias" <$> TF.argument _account_alias
        ]

$(TF.makeSchemaLenses
    ''RamAccountAliasResource
    ''TF.AliCloud
    ''TF.Resource)

ramAccountAliasResource :: TF.Resource TF.AliCloud RamAccountAliasResource
ramAccountAliasResource =
    TF.newResource "alicloud_ram_account_alias" $
        RamAccountAliasResource {
            _account_alias = TF.Nil
            , _computed_account_alias = TF.Compute "account_alias"
            }

{- | The @alicloud_ram_group_membership@ AliCloud resource.

Provides a RAM Group membership resource.
-}
data RamGroupMembershipResource = RamGroupMembershipResource {
      _group_name          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM group. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _user_names          :: !(TF.Argument Text)
    {- ^ (Required) Set of user name which will be added to group. Each name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin with a hyphen. -}
    , _computed_group_name :: !(TF.Attribute Text)
    {- ^ - The group name. -}
    , _computed_id         :: !(TF.Attribute Text)
    {- ^ - The membership ID. -}
    , _computed_user_names :: !(TF.Attribute Text)
    {- ^ - The list of names of users which in the group. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamGroupMembershipResource where
    toHCL RamGroupMembershipResource{..} = TF.block $ catMaybes
        [ TF.assign "group_name" <$> TF.argument _group_name
        , TF.assign "user_names" <$> TF.argument _user_names
        ]

$(TF.makeSchemaLenses
    ''RamGroupMembershipResource
    ''TF.AliCloud
    ''TF.Resource)

ramGroupMembershipResource :: TF.Resource TF.AliCloud RamGroupMembershipResource
ramGroupMembershipResource =
    TF.newResource "alicloud_ram_group_membership" $
        RamGroupMembershipResource {
            _group_name = TF.Nil
            , _user_names = TF.Nil
            , _computed_group_name = TF.Compute "group_name"
            , _computed_id = TF.Compute "id"
            , _computed_user_names = TF.Compute "user_names"
            }

{- | The @alicloud_ram_group_policy_attachment@ AliCloud resource.

Provides a RAM Group Policy attachment resource.
-}
data RamGroupPolicyAttachmentResource = RamGroupPolicyAttachmentResource {
      _group_name           :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM group. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _policy_name          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _policy_type          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Type of the RAM policy. It must be @Custom@ or @System@ . -}
    , _computed_group_name  :: !(TF.Attribute Text)
    {- ^ - The group name. -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The attachment ID. -}
    , _computed_policy_name :: !(TF.Attribute Text)
    {- ^ - The policy name. -}
    , _computed_policy_type :: !(TF.Attribute Text)
    {- ^ - The policy type. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamGroupPolicyAttachmentResource where
    toHCL RamGroupPolicyAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "group_name" <$> TF.argument _group_name
        , TF.assign "policy_name" <$> TF.argument _policy_name
        , TF.assign "policy_type" <$> TF.argument _policy_type
        ]

$(TF.makeSchemaLenses
    ''RamGroupPolicyAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

ramGroupPolicyAttachmentResource :: TF.Resource TF.AliCloud RamGroupPolicyAttachmentResource
ramGroupPolicyAttachmentResource =
    TF.newResource "alicloud_ram_group_policy_attachment" $
        RamGroupPolicyAttachmentResource {
            _group_name = TF.Nil
            , _policy_name = TF.Nil
            , _policy_type = TF.Nil
            , _computed_group_name = TF.Compute "group_name"
            , _computed_id = TF.Compute "id"
            , _computed_policy_name = TF.Compute "policy_name"
            , _computed_policy_type = TF.Compute "policy_type"
            }

{- | The @alicloud_ram_group@ AliCloud resource.

Provides a RAM Group resource. ~> NOTE: When you want to destroy this
resource forcefully(means remove all the relationships associated with it
automatically and then destroy it) without set @force@ with @true@ at
beginning, you need add @force = true@ to configuration file and run
@terraform plan@ , then you can delete resource forcefully.
-}
data RamGroupResource = RamGroupResource {
      _comments          :: !(TF.Argument Text)
    {- ^ (Optional) Comment of the RAM group. This parameter can have a string of 1 to 128 characters. -}
    , _force             :: !(TF.Argument Text)
    {- ^ (Optional) This parameter is used for resource destroy. Default value is @false@ . -}
    , _name              :: !(TF.Argument Text)
    {- ^ (Required) Name of the RAM group. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _computed_comments :: !(TF.Attribute Text)
    {- ^ - The group comments. -}
    , _computed_id       :: !(TF.Attribute Text)
    {- ^ - The group ID. -}
    , _computed_name     :: !(TF.Attribute Text)
    {- ^ - The group name. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamGroupResource where
    toHCL RamGroupResource{..} = TF.block $ catMaybes
        [ TF.assign "comments" <$> TF.argument _comments
        , TF.assign "force" <$> TF.argument _force
        , TF.assign "name" <$> TF.argument _name
        ]

$(TF.makeSchemaLenses
    ''RamGroupResource
    ''TF.AliCloud
    ''TF.Resource)

ramGroupResource :: TF.Resource TF.AliCloud RamGroupResource
ramGroupResource =
    TF.newResource "alicloud_ram_group" $
        RamGroupResource {
            _comments = TF.Nil
            , _force = TF.Nil
            , _name = TF.Nil
            , _computed_comments = TF.Compute "comments"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            }

{- | The @alicloud_ram_login_profile@ AliCloud resource.

Provides a RAM User Login Profile resource.
-}
data RamLoginProfileResource = RamLoginProfileResource {
      _mfa_bind_required                :: !(TF.Argument Text)
    {- ^ (Optional) This parameter indicates whether the MFA needs to be bind when the user first logs in. Default value is @false@ . -}
    , _password                         :: !(TF.Argument Text)
    {- ^ (Required) Password of the RAM user. -}
    , _password_reset_required          :: !(TF.Argument Text)
    {- ^ (Optional) This parameter indicates whether the password needs to be reset when the user first logs in. Default value is @false@ . -}
    , _user_name                        :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM user. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin with a hyphen. -}
    , _computed_id                      :: !(TF.Attribute Text)
    {- ^ - The login profile ID. -}
    , _computed_mfa_bind_required       :: !(TF.Attribute Text)
    {- ^ - The parameter which indicates whether the MFA needs to be bind when the user first logs in. -}
    , _computed_password_reset_required :: !(TF.Attribute Text)
    {- ^ - The parameter which indicates whether the password needs to be reset when the user first logs in. -}
    , _computed_user_name               :: !(TF.Attribute Text)
    {- ^ - The user name. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamLoginProfileResource where
    toHCL RamLoginProfileResource{..} = TF.block $ catMaybes
        [ TF.assign "mfa_bind_required" <$> TF.argument _mfa_bind_required
        , TF.assign "password" <$> TF.argument _password
        , TF.assign "password_reset_required" <$> TF.argument _password_reset_required
        , TF.assign "user_name" <$> TF.argument _user_name
        ]

$(TF.makeSchemaLenses
    ''RamLoginProfileResource
    ''TF.AliCloud
    ''TF.Resource)

ramLoginProfileResource :: TF.Resource TF.AliCloud RamLoginProfileResource
ramLoginProfileResource =
    TF.newResource "alicloud_ram_login_profile" $
        RamLoginProfileResource {
            _mfa_bind_required = TF.Nil
            , _password = TF.Nil
            , _password_reset_required = TF.Nil
            , _user_name = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_mfa_bind_required = TF.Compute "mfa_bind_required"
            , _computed_password_reset_required = TF.Compute "password_reset_required"
            , _computed_user_name = TF.Compute "user_name"
            }

{- | The @alicloud_ram_policy@ AliCloud resource.

Provides a RAM Policy resource. ~> NOTE: When you want to destroy this
resource forcefully(means remove all the relationships associated with it
automatically and then destroy it) without set @force@ with @true@ at
beginning, you need add @force = true@ to configuration file and run
@terraform plan@ , then you can delete resource forcefully.
-}
data RamPolicyResource = RamPolicyResource {
      _description               :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Description of the RAM policy. This name can have a string of 1 to 1024 characters. -}
    , _document                  :: !(TF.Argument Text)
    {- ^ (Optional, Conflicts with @statement@ and @version@ ) Document of the RAM policy. It is required when the @statement@ is not specified. -}
    , _force                     :: !(TF.Argument Text)
    {- ^ (Optional) This parameter is used for resource destroy. Default value is @false@ . -}
    , _name                      :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _statement                 :: !(TF.Argument Text)
    {- ^ (Optional,  Type: list, Conflicts with @document@ ) Statements of the RAM policy document. It is required when the @document@ is not specified. -}
    , _version                   :: !(TF.Argument Text)
    {- ^ (Optional, Conflicts with @document@ ) Version of the RAM policy document. Valid value is @1@ . Default value is @1@ . -}
    , _computed_attachment_count :: !(TF.Attribute Text)
    {- ^ - The policy attachment count. -}
    , _computed_description      :: !(TF.Attribute Text)
    {- ^ - The policy description. -}
    , _computed_document         :: !(TF.Attribute Text)
    {- ^ - The policy document. -}
    , _computed_id               :: !(TF.Attribute Text)
    {- ^ - The policy ID. -}
    , _computed_name             :: !(TF.Attribute Text)
    {- ^ - The policy name. -}
    , _computed_statement        :: !(TF.Attribute Text)
    {- ^ - List of statement of the policy document. -}
    , _computed_type'            :: !(TF.Attribute Text)
    {- ^ - The policy type. -}
    , _computed_version          :: !(TF.Attribute Text)
    {- ^ - The policy document version. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamPolicyResource where
    toHCL RamPolicyResource{..} = TF.block $ catMaybes
        [ TF.assign "description" <$> TF.argument _description
        , TF.assign "document" <$> TF.argument _document
        , TF.assign "force" <$> TF.argument _force
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "statement" <$> TF.argument _statement
        , TF.assign "version" <$> TF.argument _version
        ]

$(TF.makeSchemaLenses
    ''RamPolicyResource
    ''TF.AliCloud
    ''TF.Resource)

ramPolicyResource :: TF.Resource TF.AliCloud RamPolicyResource
ramPolicyResource =
    TF.newResource "alicloud_ram_policy" $
        RamPolicyResource {
            _description = TF.Nil
            , _document = TF.Nil
            , _force = TF.Nil
            , _name = TF.Nil
            , _statement = TF.Nil
            , _version = TF.Nil
            , _computed_attachment_count = TF.Compute "attachment_count"
            , _computed_description = TF.Compute "description"
            , _computed_document = TF.Compute "document"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_statement = TF.Compute "statement"
            , _computed_type' = TF.Compute "type"
            , _computed_version = TF.Compute "version"
            }

{- | The @alicloud_ram_role_attachment@ AliCloud resource.

Provides a RAM role attachment resource to bind role for several ECS
instances.
-}
data RamRoleAttachmentResource = RamRoleAttachmentResource {
      _instance_ids          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The list of ECS instance's IDs. -}
    , _role_name             :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The name of role used to bind. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-", "_", and must not begin with a hyphen. -}
    , _computed_instance_ids :: !(TF.Attribute Text)
    {- ^ The list of ECS instance's IDs. -}
    , _computed_role_name    :: !(TF.Attribute Text)
    {- ^ - The name of the role. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamRoleAttachmentResource where
    toHCL RamRoleAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "instance_ids" <$> TF.argument _instance_ids
        , TF.assign "role_name" <$> TF.argument _role_name
        ]

$(TF.makeSchemaLenses
    ''RamRoleAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

ramRoleAttachmentResource :: TF.Resource TF.AliCloud RamRoleAttachmentResource
ramRoleAttachmentResource =
    TF.newResource "alicloud_ram_role_attachment" $
        RamRoleAttachmentResource {
            _instance_ids = TF.Nil
            , _role_name = TF.Nil
            , _computed_instance_ids = TF.Compute "instance_ids"
            , _computed_role_name = TF.Compute "role_name"
            }

{- | The @alicloud_ram_role_policy_attachment@ AliCloud resource.

Provides a RAM Role attachment resource.
-}
data RamRolePolicyAttachmentResource = RamRolePolicyAttachmentResource {
      _policy_name          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _policy_type          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Type of the RAM policy. It must be @Custom@ or @System@ . -}
    , _role_name            :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM Role. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-", "_", and must not begin with a hyphen. -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The attachment ID. -}
    , _computed_policy_name :: !(TF.Attribute Text)
    {- ^ - The policy name. -}
    , _computed_policy_type :: !(TF.Attribute Text)
    {- ^ - The policy type. -}
    , _computed_role_name   :: !(TF.Attribute Text)
    {- ^ - The role name. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamRolePolicyAttachmentResource where
    toHCL RamRolePolicyAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "policy_name" <$> TF.argument _policy_name
        , TF.assign "policy_type" <$> TF.argument _policy_type
        , TF.assign "role_name" <$> TF.argument _role_name
        ]

$(TF.makeSchemaLenses
    ''RamRolePolicyAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

ramRolePolicyAttachmentResource :: TF.Resource TF.AliCloud RamRolePolicyAttachmentResource
ramRolePolicyAttachmentResource =
    TF.newResource "alicloud_ram_role_policy_attachment" $
        RamRolePolicyAttachmentResource {
            _policy_name = TF.Nil
            , _policy_type = TF.Nil
            , _role_name = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_policy_name = TF.Compute "policy_name"
            , _computed_policy_type = TF.Compute "policy_type"
            , _computed_role_name = TF.Compute "role_name"
            }

{- | The @alicloud_ram_role@ AliCloud resource.

Provides a RAM Role resource. ~> NOTE: When you want to destroy this
resource forcefully(means remove all the relationships associated with it
automatically and then destroy it) without set @force@ with @true@ at
beginning, you need add @force = true@ to configuration file and run
@terraform plan@ , then you can delete resource forcefully.
-}
data RamRoleResource = RamRoleResource {
      _description          :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Description of the RAM role. This name can have a string of 1 to 1024 characters. -}
    , _document             :: !(TF.Argument Text)
    {- ^ (Optional, Conflicts with @services@ , @ram_users@ and @version@ ) Authorization strategy of the RAM role. It is required when the @services@ and @ram_users@ are not specified. -}
    , _force                :: !(TF.Argument Text)
    {- ^ (Optional) This parameter is used for resource destroy. Default value is @false@ . -}
    , _name                 :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM role. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-", "_", and must not begin with a hyphen. -}
    , _ram_users            :: !(TF.Argument Text)
    {- ^ (Optional, Type: list, Conflicts with @document@ ) List of ram users who can assume the RAM role. The format of each item in this list is @acs:ram::${account_id}:root@ or @acs:ram::${account_id}:user/${user_name}@ , such as @acs:ram::1234567890000:root@ and @acs:ram::1234567890001:user/Mary@ . The @${user_name}@ is the name of a RAM user which must exists in the Alicloud account indicated by the @${account_id}@ . -}
    , _services             :: !(TF.Argument Text)
    {- ^ (Optional, Type: list, Conflicts with @document@ ) List of services which can assume the RAM role. The format of each item in this list is @${service}.aliyuncs.com@ or @${account_id}@${service}.aliyuncs.com@ , such as @ecs.aliyuncs.com@ and @1234567890000@ots.aliyuncs.com@ . The @${service}@ can be @ecs@ , @log@ , @apigateway@ and so on, the @${account_id}@ refers to someone's Alicloud account id. -}
    , _version              :: !(TF.Argument Text)
    {- ^ (Optional, Conflicts with @document@ ) Version of the RAM role policy document. Valid value is @1@ . Default value is @1@ . -}
    , _computed_arn         :: !(TF.Attribute Text)
    {- ^ - The role arn. -}
    , _computed_description :: !(TF.Attribute Text)
    {- ^ - The role description. -}
    , _computed_document    :: !(TF.Attribute Text)
    {- ^ - Authorization strategy of the role. -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The role ID. -}
    , _computed_name        :: !(TF.Attribute Text)
    {- ^ - The role name. -}
    , _computed_ram_users   :: !(TF.Attribute Text)
    {- ^ - List of services which can assume the RAM role. -}
    , _computed_services    :: !(TF.Attribute Text)
    {- ^ - List of services which can assume the RAM role. -}
    , _computed_version     :: !(TF.Attribute Text)
    {- ^ - The role policy document version. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamRoleResource where
    toHCL RamRoleResource{..} = TF.block $ catMaybes
        [ TF.assign "description" <$> TF.argument _description
        , TF.assign "document" <$> TF.argument _document
        , TF.assign "force" <$> TF.argument _force
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "ram_users" <$> TF.argument _ram_users
        , TF.assign "services" <$> TF.argument _services
        , TF.assign "version" <$> TF.argument _version
        ]

$(TF.makeSchemaLenses
    ''RamRoleResource
    ''TF.AliCloud
    ''TF.Resource)

ramRoleResource :: TF.Resource TF.AliCloud RamRoleResource
ramRoleResource =
    TF.newResource "alicloud_ram_role" $
        RamRoleResource {
            _description = TF.Nil
            , _document = TF.Nil
            , _force = TF.Nil
            , _name = TF.Nil
            , _ram_users = TF.Nil
            , _services = TF.Nil
            , _version = TF.Nil
            , _computed_arn = TF.Compute "arn"
            , _computed_description = TF.Compute "description"
            , _computed_document = TF.Compute "document"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_ram_users = TF.Compute "ram_users"
            , _computed_services = TF.Compute "services"
            , _computed_version = TF.Compute "version"
            }

{- | The @alicloud_ram_user_policy_attachment@ AliCloud resource.

Provides a RAM User Policy attachment resource.
-}
data RamUserPolicyAttachmentResource = RamUserPolicyAttachmentResource {
      _policy_name          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen. -}
    , _policy_type          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Type of the RAM policy. It must be @Custom@ or @System@ . -}
    , _user_name            :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) Name of the RAM user. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin with a hyphen. -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The attachment ID. -}
    , _computed_policy_name :: !(TF.Attribute Text)
    {- ^ - The policy name. -}
    , _computed_policy_type :: !(TF.Attribute Text)
    {- ^ - The policy type. -}
    , _computed_user_name   :: !(TF.Attribute Text)
    {- ^ - The user name. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamUserPolicyAttachmentResource where
    toHCL RamUserPolicyAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "policy_name" <$> TF.argument _policy_name
        , TF.assign "policy_type" <$> TF.argument _policy_type
        , TF.assign "user_name" <$> TF.argument _user_name
        ]

$(TF.makeSchemaLenses
    ''RamUserPolicyAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

ramUserPolicyAttachmentResource :: TF.Resource TF.AliCloud RamUserPolicyAttachmentResource
ramUserPolicyAttachmentResource =
    TF.newResource "alicloud_ram_user_policy_attachment" $
        RamUserPolicyAttachmentResource {
            _policy_name = TF.Nil
            , _policy_type = TF.Nil
            , _user_name = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_policy_name = TF.Compute "policy_name"
            , _computed_policy_type = TF.Compute "policy_type"
            , _computed_user_name = TF.Compute "user_name"
            }

{- | The @alicloud_ram_user@ AliCloud resource.

Provides a RAM User resource. ~> NOTE: When you want to destroy this
resource forcefully(means release all the relationships associated with it
automatically and then destroy it) without set @force@ with @true@ at
beginning, you need add @force = true@ to configuration file and run
@terraform plan@ , then you can delete resource forcefully.
-}
data RamUserResource = RamUserResource {
      _comments              :: !(TF.Argument Text)
    {- ^ (Optional) Comment of the RAM user. This parameter can have a string of 1 to 128 characters. -}
    , _display_name          :: !(TF.Argument Text)
    {- ^ (Optional) Name of the RAM user which for display. This name can have a string of 1 to 12 characters or Chinese characters, must contain only alphanumeric characters or Chinese characters or hyphens, such as "-",".", and must not end with a hyphen. -}
    , _email                 :: !(TF.Argument Text)
    {- ^ (Optional) Email of the RAM user. -}
    , _force                 :: !(TF.Argument Text)
    {- ^ (Optional) This parameter is used for resource destroy. Default value is @false@ . -}
    , _mobile                :: !(TF.Argument Text)
    {- ^ (Optional) Phone number of the RAM user. This number must contain an international area code prefix, just look like this: 86-18600008888. -}
    , _name                  :: !(TF.Argument Text)
    {- ^ (Required) Name of the RAM user. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-",".","_", and must not begin with a hyphen. -}
    , _computed_comments     :: !(TF.Attribute Text)
    {- ^ - The user comments. -}
    , _computed_display_name :: !(TF.Attribute Text)
    {- ^ - The user display name. -}
    , _computed_email        :: !(TF.Attribute Text)
    {- ^ - The user email. -}
    , _computed_id           :: !(TF.Attribute Text)
    {- ^ - The user ID. -}
    , _computed_mobile       :: !(TF.Attribute Text)
    {- ^ - The user phone number. -}
    , _computed_name         :: !(TF.Attribute Text)
    {- ^ - The user name. -}
    } deriving (Show, Eq)

instance TF.ToHCL RamUserResource where
    toHCL RamUserResource{..} = TF.block $ catMaybes
        [ TF.assign "comments" <$> TF.argument _comments
        , TF.assign "display_name" <$> TF.argument _display_name
        , TF.assign "email" <$> TF.argument _email
        , TF.assign "force" <$> TF.argument _force
        , TF.assign "mobile" <$> TF.argument _mobile
        , TF.assign "name" <$> TF.argument _name
        ]

$(TF.makeSchemaLenses
    ''RamUserResource
    ''TF.AliCloud
    ''TF.Resource)

ramUserResource :: TF.Resource TF.AliCloud RamUserResource
ramUserResource =
    TF.newResource "alicloud_ram_user" $
        RamUserResource {
            _comments = TF.Nil
            , _display_name = TF.Nil
            , _email = TF.Nil
            , _force = TF.Nil
            , _mobile = TF.Nil
            , _name = TF.Nil
            , _computed_comments = TF.Compute "comments"
            , _computed_display_name = TF.Compute "display_name"
            , _computed_email = TF.Compute "email"
            , _computed_id = TF.Compute "id"
            , _computed_mobile = TF.Compute "mobile"
            , _computed_name = TF.Compute "name"
            }

{- | The @alicloud_route_entry@ AliCloud resource.

Provides a route entry resource. A route entry represents a route item of
one VPC route table.
-}
data RouteEntryResource = RouteEntryResource {
      _destination_cidrblock          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The RouteEntry's target network segment. -}
    , _nexthop_id                     :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The route entry's next hop. ECS instance ID or VPC router interface ID. -}
    , _nexthop_type                   :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The next hop type. Available value is @Instance@ and @RouterInterface@ . @Instance@ points to ECS Instance. -}
    , _route_table_id                 :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The ID of the route table. -}
    , _computed_destination_cidrblock :: !(TF.Attribute Text)
    {- ^ - The RouteEntry's target network segment. -}
    , _computed_nexthop_id            :: !(TF.Attribute Text)
    {- ^ - The route entry's next hop. -}
    , _computed_nexthop_type          :: !(TF.Attribute Text)
    {- ^ - The next hop type. -}
    , _computed_route_table_id        :: !(TF.Attribute Text)
    {- ^ - The ID of the route table. -}
    , _computed_router_id             :: !(TF.Attribute Text)
    {- ^ - The ID of the virtual router attached to Vpc. -}
    } deriving (Show, Eq)

instance TF.ToHCL RouteEntryResource where
    toHCL RouteEntryResource{..} = TF.block $ catMaybes
        [ TF.assign "destination_cidrblock" <$> TF.argument _destination_cidrblock
        , TF.assign "nexthop_id" <$> TF.argument _nexthop_id
        , TF.assign "nexthop_type" <$> TF.argument _nexthop_type
        , TF.assign "route_table_id" <$> TF.argument _route_table_id
        ]

$(TF.makeSchemaLenses
    ''RouteEntryResource
    ''TF.AliCloud
    ''TF.Resource)

routeEntryResource :: TF.Resource TF.AliCloud RouteEntryResource
routeEntryResource =
    TF.newResource "alicloud_route_entry" $
        RouteEntryResource {
            _destination_cidrblock = TF.Nil
            , _nexthop_id = TF.Nil
            , _nexthop_type = TF.Nil
            , _route_table_id = TF.Nil
            , _computed_destination_cidrblock = TF.Compute "destination_cidrblock"
            , _computed_nexthop_id = TF.Compute "nexthop_id"
            , _computed_nexthop_type = TF.Compute "nexthop_type"
            , _computed_route_table_id = TF.Compute "route_table_id"
            , _computed_router_id = TF.Compute "router_id"
            }

{- | The @alicloud_router_interface@ AliCloud resource.

Provides a VPC router interface resource to connect two VPCs by connecting
the router interfaces . ~> NOTE: Only one pair of connected router
interfaces can exist between two routers. Up to 5 router interfaces can be
created for each router and each account.
-}
data RouterInterfaceResource = RouterInterfaceResource {
      _access_point_id                      :: !(TF.Argument Text)
    {- ^ (Optional, Force New) Access point ID. Required when @router_type@ is @VBR@ . Prohibited when @router_type@ is @VRouter@ . -}
    , _description                          :: !(TF.Argument Text)
    {- ^ (Optional) Description of the router interface. It can be 2-256 characters long or left blank. It cannot start with http:// and https://. -}
    , _health_check_source_ip               :: !(TF.Argument Text)
    {- ^ (Optional) Used as the Packet Source IP of health check for disaster recovery or ECMP. It is only valid when @router_type@ is @VRouter@ and @opposite_router_type@ is @VBR@ . The IP must be an unused IP in the local VPC. It and @health_check_target_ip@ must be specified at the same time. -}
    , _health_check_target_ip               :: !(TF.Argument Text)
    {- ^ (Optional) Used as the Packet Target IP of health check for disaster recovery or ECMP. It is only valid when @router_type@ is @VRouter@ and @opposite_router_type@ is @VBR@ . The IP must be an unused IP in the local VPC. It and @health_check_source_ip@ must be specified at the same time. -}
    , _name                                 :: !(TF.Argument Text)
    {- ^ (Optional) Name of the router interface. Length must be 2-80 characters long. Only Chinese characters, English letters, numbers, period (.), underline (_), or dash (-) are permitted. If it is not specified, the default value is interface ID. The name cannot start with http:// and https://. -}
    , _opposite_access_point_id             :: !(TF.Argument Text)
    {- ^ (Optional, Force New) Access point ID of peer side. Required when @opposite_router_type@ is @VBR@ . Prohibited when @opposite_router_type@ is @VRouter@ . -}
    , _opposite_interface_id                :: !(TF.Argument Text)
    {- ^ (Optional) Peer router interface ID. -}
    , _opposite_interface_owner_id          :: !(TF.Argument Text)
    {- ^ (Optional) Peer account ID. Log on to the Alibaba Cloud console, select User Info > Account Management to check your account ID. -}
    , _opposite_region                      :: !(TF.Argument Text)
    {- ^ (Required, Force New) The Region of peer side. At present, optional value: @cn-beijing@ , @cn-hangzhou@ , @cn-shanghai@ , @cn-shenzhen@ , @cn-hongkong@ , @ap-southeast-1@ , @us-east-1@ , @us-west-1@ . -}
    , _opposite_router_id                   :: !(TF.Argument Text)
    {- ^ (Optional) Peer router ID. When @opposite_router_type@ is VBR, the @opposite_router_id@ must be in the access point specified by @opposite_access_point_id@ . -}
    , _opposite_router_type                 :: !(TF.Argument Text)
    {- ^ (Optional, Force New) Peer router type. Optional value: @VRouter@ , @VBR@ . Default to @VRouter@ . -}
    , _role                                 :: !(TF.Argument Text)
    {- ^ (Required, Force New) The role the router interface plays. Optional value: @InitiatingSide@ , @AcceptingSide@ . -}
    , _router_id                            :: !(TF.Argument Text)
    {- ^ (Required, Force New) Router ID. When @router_type@ is VBR, the VBR specified by the @router_id@ must be in the access point specified by @access_point_id@ . -}
    , _router_type                          :: !(TF.Argument Text)
    {- ^ (Required, Forces New) Router Type. Optional value: VRouter, VBR. -}
    , _specification                        :: !(TF.Argument Text)
    {- ^ (Optional) Specification of router interfaces. If @role@ is @AcceptingSide@ , the value can be ignore or must be @Negative@ . For more about the specification, refer to <https://www.alibabacloud.com/help/doc-detail/52415.htm?spm=a3c0i.o52412zh.b99.10.698e566fdVCfKD> . -}
    , _computed_access_point_id             :: !(TF.Attribute Text)
    {- ^ - Access point of the router interface. -}
    , _computed_description                 :: !(TF.Attribute Text)
    {- ^ - Router interface description. -}
    , _computed_health_check_source_ip      :: !(TF.Attribute Text)
    {- ^ - Source IP of Packet of Line HealthCheck. -}
    , _computed_health_check_target_ip      :: !(TF.Attribute Text)
    {- ^ - Target IP of Packet of Line HealthCheck. -}
    , _computed_id                          :: !(TF.Attribute Text)
    {- ^ - Router interface ID. -}
    , _computed_name                        :: !(TF.Attribute Text)
    {- ^ - Router interface name. -}
    , _computed_opposite_access_point_id    :: !(TF.Attribute Text)
    {- ^ - Access point of the opposite router interface. -}
    , _computed_opposite_interface_id       :: !(TF.Attribute Text)
    {- ^ - Peer router interface ID. -}
    , _computed_opposite_interface_owner_id :: !(TF.Attribute Text)
    {- ^ - Peer account ID. -}
    , _computed_opposite_router_id          :: !(TF.Attribute Text)
    {- ^ - Peer router ID. -}
    , _computed_opposite_router_type        :: !(TF.Attribute Text)
    {- ^ - Peer router type. -}
    , _computed_role                        :: !(TF.Attribute Text)
    {- ^ - Router interface role. -}
    , _computed_router_id                   :: !(TF.Attribute Text)
    {- ^ - Router ID. -}
    , _computed_router_type                 :: !(TF.Attribute Text)
    {- ^ - Router type. -}
    , _computed_specification               :: !(TF.Attribute Text)
    {- ^ - Router nterface specification. -}
    } deriving (Show, Eq)

instance TF.ToHCL RouterInterfaceResource where
    toHCL RouterInterfaceResource{..} = TF.block $ catMaybes
        [ TF.assign "access_point_id" <$> TF.argument _access_point_id
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "health_check_source_ip" <$> TF.argument _health_check_source_ip
        , TF.assign "health_check_target_ip" <$> TF.argument _health_check_target_ip
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "opposite_access_point_id" <$> TF.argument _opposite_access_point_id
        , TF.assign "opposite_interface_id" <$> TF.argument _opposite_interface_id
        , TF.assign "opposite_interface_owner_id" <$> TF.argument _opposite_interface_owner_id
        , TF.assign "opposite_region" <$> TF.argument _opposite_region
        , TF.assign "opposite_router_id" <$> TF.argument _opposite_router_id
        , TF.assign "opposite_router_type" <$> TF.argument _opposite_router_type
        , TF.assign "role" <$> TF.argument _role
        , TF.assign "router_id" <$> TF.argument _router_id
        , TF.assign "router_type" <$> TF.argument _router_type
        , TF.assign "specification" <$> TF.argument _specification
        ]

$(TF.makeSchemaLenses
    ''RouterInterfaceResource
    ''TF.AliCloud
    ''TF.Resource)

routerInterfaceResource :: TF.Resource TF.AliCloud RouterInterfaceResource
routerInterfaceResource =
    TF.newResource "alicloud_router_interface" $
        RouterInterfaceResource {
            _access_point_id = TF.Nil
            , _description = TF.Nil
            , _health_check_source_ip = TF.Nil
            , _health_check_target_ip = TF.Nil
            , _name = TF.Nil
            , _opposite_access_point_id = TF.Nil
            , _opposite_interface_id = TF.Nil
            , _opposite_interface_owner_id = TF.Nil
            , _opposite_region = TF.Nil
            , _opposite_router_id = TF.Nil
            , _opposite_router_type = TF.Nil
            , _role = TF.Nil
            , _router_id = TF.Nil
            , _router_type = TF.Nil
            , _specification = TF.Nil
            , _computed_access_point_id = TF.Compute "access_point_id"
            , _computed_description = TF.Compute "description"
            , _computed_health_check_source_ip = TF.Compute "health_check_source_ip"
            , _computed_health_check_target_ip = TF.Compute "health_check_target_ip"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_opposite_access_point_id = TF.Compute "opposite_access_point_id"
            , _computed_opposite_interface_id = TF.Compute "opposite_interface_id"
            , _computed_opposite_interface_owner_id = TF.Compute "opposite_interface_owner_id"
            , _computed_opposite_router_id = TF.Compute "opposite_router_id"
            , _computed_opposite_router_type = TF.Compute "opposite_router_type"
            , _computed_role = TF.Compute "role"
            , _computed_router_id = TF.Compute "router_id"
            , _computed_router_type = TF.Compute "router_type"
            , _computed_specification = TF.Compute "specification"
            }

{- | The @alicloud_security_group@ AliCloud resource.

Provides a security group resource. ~> NOTE:  @alicloud_security_group@ is
used to build and manage a security group, and
@alicloud_security_group_rule@ can define ingress or egress rules for it.
-}
data SecurityGroupResource = SecurityGroupResource {
      _description          :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The security group description. Defaults to null. -}
    , _name                 :: !(TF.Argument Text)
    {- ^ (Optional) The name of the security group. Defaults to null. -}
    , _vpc_id               :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The VPC ID. -}
    , _computed_description :: !(TF.Attribute Text)
    {- ^ - The description of the security group -}
    , _computed_id          :: !(TF.Attribute Text)
    {- ^ - The ID of the security group -}
    , _computed_name        :: !(TF.Attribute Text)
    {- ^ - The name of the security group -}
    , _computed_vpc_id      :: !(TF.Attribute Text)
    {- ^ - The VPC ID. -}
    } deriving (Show, Eq)

instance TF.ToHCL SecurityGroupResource where
    toHCL SecurityGroupResource{..} = TF.block $ catMaybes
        [ TF.assign "description" <$> TF.argument _description
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "vpc_id" <$> TF.argument _vpc_id
        ]

$(TF.makeSchemaLenses
    ''SecurityGroupResource
    ''TF.AliCloud
    ''TF.Resource)

securityGroupResource :: TF.Resource TF.AliCloud SecurityGroupResource
securityGroupResource =
    TF.newResource "alicloud_security_group" $
        SecurityGroupResource {
            _description = TF.Nil
            , _name = TF.Nil
            , _vpc_id = TF.Nil
            , _computed_description = TF.Compute "description"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_vpc_id = TF.Compute "vpc_id"
            }

{- | The @alicloud_security_group_rule@ AliCloud resource.

Provides a security group rule resource. Represents a single @ingress@ or
@egress@ group rule, which can be added to external Security Groups. ~>
NOTE:  @nic_type@ should set to @intranet@ when security group type is @vpc@
or specifying the @source_security_group_id@ . In this situation it does not
distinguish between intranet and internet, the rule is effective on them
both.
-}
data SecurityGroupRuleResource = SecurityGroupRuleResource {
      _cidr_ip                    :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The target IP address range. The default value is 0.0.0.0/0 (which means no restriction will be applied). Other supported formats include 10.159.6.18/12. Only IPv4 is supported. -}
    , _ip_protocol                :: !(TF.Argument Text)
    {- ^ (Required) The protocol. Can be @tcp@ , @udp@ , @icmp@ , @gre@ or @all@ . -}
    , _nic_type                   :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Network type, can be either @internet@ or @intranet@ , the default value is @internet@ . -}
    , _policy                     :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Authorization policy, can be either @accept@ or @drop@ , the default value is @accept@ . -}
    , _port_range                 :: !(TF.Argument Text)
    {- ^ (Required) The range of port numbers relevant to the IP protocol. When the protocol is tcp or udp, the default port number range is 1-65535. For example, @1/200@ means that the range of the port numbers is 1-200. -}
    , _priority                   :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) Authorization policy priority, with parameter values: @1-100@ , default value: 1. -}
    , _security_group_id          :: !(TF.Argument Text)
    {- ^ (Required) The security group to apply this rule to. -}
    , _source_group_owner_account :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The Alibaba Cloud user account Id of the target security group when security groups are authorized across accounts.  This parameter is invalid if @cidr_ip@ has already been set. -}
    , _source_security_group_id   :: !(TF.Argument Text)
    {- ^ (Optional, Forces new resource) The target security group ID within the same region. If this field is specified, the @nic_type@ can only select @intranet@ . -}
    , _type'                      :: !(TF.Argument Text)
    {- ^ (Required) The type of rule being created. Valid options are @ingress@ (inbound) or @egress@ (outbound). -}
    , _computed_id                :: !(TF.Attribute Text)
    {- ^ - The ID of the security group rule -}
    , _computed_ip_protocol       :: !(TF.Attribute Text)
    {- ^ - The protocol of the security group rule -}
    , _computed_name              :: !(TF.Attribute Text)
    {- ^ - The name of the security group -}
    , _computed_port_range        :: !(TF.Attribute Text)
    {- ^ - The range of port numbers -}
    , _computed_type'             :: !(TF.Attribute Text)
    {- ^ - The type of rule, @ingress@ or @egress@ -}
    } deriving (Show, Eq)

instance TF.ToHCL SecurityGroupRuleResource where
    toHCL SecurityGroupRuleResource{..} = TF.block $ catMaybes
        [ TF.assign "cidr_ip" <$> TF.argument _cidr_ip
        , TF.assign "ip_protocol" <$> TF.argument _ip_protocol
        , TF.assign "nic_type" <$> TF.argument _nic_type
        , TF.assign "policy" <$> TF.argument _policy
        , TF.assign "port_range" <$> TF.argument _port_range
        , TF.assign "priority" <$> TF.argument _priority
        , TF.assign "security_group_id" <$> TF.argument _security_group_id
        , TF.assign "source_group_owner_account" <$> TF.argument _source_group_owner_account
        , TF.assign "source_security_group_id" <$> TF.argument _source_security_group_id
        , TF.assign "type" <$> TF.argument _type'
        ]

$(TF.makeSchemaLenses
    ''SecurityGroupRuleResource
    ''TF.AliCloud
    ''TF.Resource)

securityGroupRuleResource :: TF.Resource TF.AliCloud SecurityGroupRuleResource
securityGroupRuleResource =
    TF.newResource "alicloud_security_group_rule" $
        SecurityGroupRuleResource {
            _cidr_ip = TF.Nil
            , _ip_protocol = TF.Nil
            , _nic_type = TF.Nil
            , _policy = TF.Nil
            , _port_range = TF.Nil
            , _priority = TF.Nil
            , _security_group_id = TF.Nil
            , _source_group_owner_account = TF.Nil
            , _source_security_group_id = TF.Nil
            , _type' = TF.Nil
            , _computed_id = TF.Compute "id"
            , _computed_ip_protocol = TF.Compute "ip_protocol"
            , _computed_name = TF.Compute "name"
            , _computed_port_range = TF.Compute "port_range"
            , _computed_type' = TF.Compute "type"
            }

{- | The @alicloud_slb_attachment@ AliCloud resource.

Provides an Application Load Balancer Attachment resource.
-}
data SlbAttachmentResource = SlbAttachmentResource {
      _instances                :: !(TF.Argument Text)
    {- ^ (Required) A list of instance ids to added backend server in the SLB. If dettachment instances then this value set []. -}
    , _slb_id                   :: !(TF.Argument Text)
    {- ^ (Required) The ID of the SLB.. -}
    , _computed_backend_servers :: !(TF.Attribute Text)
    {- ^ - The backend servers of the load balancer. -}
    } deriving (Show, Eq)

instance TF.ToHCL SlbAttachmentResource where
    toHCL SlbAttachmentResource{..} = TF.block $ catMaybes
        [ TF.assign "instances" <$> TF.argument _instances
        , TF.assign "slb_id" <$> TF.argument _slb_id
        ]

$(TF.makeSchemaLenses
    ''SlbAttachmentResource
    ''TF.AliCloud
    ''TF.Resource)

slbAttachmentResource :: TF.Resource TF.AliCloud SlbAttachmentResource
slbAttachmentResource =
    TF.newResource "alicloud_slb_attachment" $
        SlbAttachmentResource {
            _instances = TF.Nil
            , _slb_id = TF.Nil
            , _computed_backend_servers = TF.Compute "backend_servers"
            }

{- | The @alicloud_slb_listener@ AliCloud resource.

Provides an Application Load Balancer Listener resource.
-}
data SlbListenerResource = SlbListenerResource {
      _backend_port              :: !(TF.Argument Text)
    {- ^ (Required, ForceNew) Port used by the Server Load Balancer instance backend. Valid value range: [1-65535]. -}
    , _bandwidth                 :: !(TF.Argument Text)
    {- ^ (Required) Bandwidth peak of Listener. For the public network instance charged per traffic consumed, the Bandwidth on Listener can be set to -1, indicating the bandwidth peak is unlimited. Valid values are [-1, 1-1000] in Mbps. -}
    , _cookie                    :: !(TF.Argument Text)
    {- ^ - (Optinal) The cookie configured on the server. It is mandatory when @sticky_session@ is "on" and @sticky_session_type@ is "server". Otherwise, it will be ignored. Valid value：String in line with RFC 2965, with length being 1- 200. It only contains characters such as ASCII codes, English letters and digits instead of the comma, semicolon or spacing, and it cannot start with $. -}
    , _cookie_timeout            :: !(TF.Argument Text)
    {- ^ - (Optinal) Cookie timeout. It is mandatory when @sticky_session@ is "on" and @sticky_session_type@ is "insert". Otherwise, it will be ignored. Valid value range: [1-86400] in seconds. -}
    , _frontend_port             :: !(TF.Argument Text)
    {- ^ (Required, ForceNew) Port used by the Server Load Balancer instance frontend. Valid value range: [1-65535]. -}
    , _health_check              :: !(TF.Argument Text)
    {- ^ - (Optinal) Whether to enable health check. Valid values are @on@ and @off@ . TCP and UDP listener's HealthCheck is always on, so it will be ignore when launching TCP or UDP listener. -}
    , _health_check_connect_port :: !(TF.Argument Text)
    {- ^ - (Optinal) Port used for health check. Valid value range: [1-65535]. Default to "None" means the backend server port is used. -}
    , _health_check_domain       :: !(TF.Argument Text)
    {- ^ - (Optinal) Domain name used for health check. When it used to launch TCP listener, @health_check_type@ must be "http". Its length is limited to 1-80 and only characters such as letters, digits, ‘-‘ and ‘.’ are allowed. When it is not set or empty,  Server Load Balancer uses the private network IP address of each backend server as Domain used for health check. -}
    , _health_check_http_code    :: !(TF.Argument Text)
    {- ^ - (Optinal) Regular health check HTTP status code. Multiple codes are segmented by “,”. It is required when @health_check@ is on. Default to @http_2xx@ .  Valid values are: @http_2xx@ , @http_3xx@ , @http_4xx@ and @http_5xx@ . -}
    , _health_check_interval     :: !(TF.Argument Text)
    {- ^ - (Optinal) Time interval of health checks. It is required when @health_check@ is on. Valid value range: [1-50] in seconds. Default to 2. -}
    , _health_check_timeout      :: !(TF.Argument Text)
    {- ^ - (Optinal) Maximum timeout of each health check response. It is required when @health_check@ is on. Valid value range: [1-300] in seconds. Default to 5. Note: If @health_check_timeout@ < @health_check_interval@ , its will be replaced by @health_check_interval@ . -}
    , _health_check_type         :: !(TF.Argument Text)
    {- ^ - (Optinal) Type of health check. Valid values are: @tcp@ and @http@ . Default to @tcp@ . TCP supports TCP and HTTP health check mode, you can select the particular mode depending on your application. -}
    , _health_check_uri          :: !(TF.Argument Text)
    {- ^ - (Optinal) URI used for health check. When it used to launch TCP listener, @health_check_type@ must be "http". Its length is limited to 1-80 and it must start with /. Only characters such as letters, digits, ‘-’, ‘/’, ‘.’, ‘%’, ‘?’, #’ and ‘&’ are allowed. -}
    , _healthy_threshold         :: !(TF.Argument Text)
    {- ^ - (Optinal) Threshold determining the result of the health check is success. It is required when @health_check@ is on. Valid value range: [1-10] in seconds. Default to 3. -}
    , _load_balancer_id          :: !(TF.Argument Text)
    {- ^ (Required, ForceNew) The Load Balancer ID which is used to launch a new listener. -}
    , _persistence_timeout       :: !(TF.Argument Text)
    {- ^ - (Optinal) Timeout of connection persistence. Valid value range: [0-3600] in seconds. Default to 0 and means closing it. -}
    , _protocol                  :: !(TF.Argument Text)
    {- ^ (Required, ForceNew) The protocol to listen on. Valid values are [ @http@ , @https@ , @tcp@ , @udp@ ]. -}
    , _scheduler                 :: !(TF.Argument Text)
    {- ^ - (Optinal) Scheduling algorithm, Valid values are @wrr@ and @wlc@ .  Default to "wrr". -}
    , _ssl_certificate_id        :: !(TF.Argument Text)
    {- ^ - (Optinal) Security certificate ID. -}
    , _sticky_session            :: !(TF.Argument Text)
    {- ^ - (Optinal) Whether to enable session persistence, Valid values are @on@ and @off@ . Default to @off@ . -}
    , _sticky_session_type       :: !(TF.Argument Text)
    {- ^ - (Optinal) Mode for handling the cookie. If @sticky_session@ is "on", it is mandatory. Otherwise, it will be ignored. Valid values are @insert@ and @server@ . @insert@ means it is inserted from Server Load Balancer; @server@ means the Server Load Balancer learns from the backend server. -}
    , _unhealthy_threshold       :: !(TF.Argument Text)
    {- ^ - (Optinal) Threshold determining the result of the health check is fail. It is required when @health_check@ is on. Valid value range: [1-10] in seconds. Default to 3. -}
    } deriving (Show, Eq)

instance TF.ToHCL SlbListenerResource where
    toHCL SlbListenerResource{..} = TF.block $ catMaybes
        [ TF.assign "backend_port" <$> TF.argument _backend_port
        , TF.assign "bandwidth" <$> TF.argument _bandwidth
        , TF.assign "cookie" <$> TF.argument _cookie
        , TF.assign "cookie_timeout" <$> TF.argument _cookie_timeout
        , TF.assign "frontend_port" <$> TF.argument _frontend_port
        , TF.assign "health_check" <$> TF.argument _health_check
        , TF.assign "health_check_connect_port" <$> TF.argument _health_check_connect_port
        , TF.assign "health_check_domain" <$> TF.argument _health_check_domain
        , TF.assign "health_check_http_code" <$> TF.argument _health_check_http_code
        , TF.assign "health_check_interval" <$> TF.argument _health_check_interval
        , TF.assign "health_check_timeout" <$> TF.argument _health_check_timeout
        , TF.assign "health_check_type" <$> TF.argument _health_check_type
        , TF.assign "health_check_uri" <$> TF.argument _health_check_uri
        , TF.assign "healthy_threshold" <$> TF.argument _healthy_threshold
        , TF.assign "load_balancer_id" <$> TF.argument _load_balancer_id
        , TF.assign "persistence_timeout" <$> TF.argument _persistence_timeout
        , TF.assign "protocol" <$> TF.argument _protocol
        , TF.assign "scheduler" <$> TF.argument _scheduler
        , TF.assign "ssl_certificate_id" <$> TF.argument _ssl_certificate_id
        , TF.assign "sticky_session" <$> TF.argument _sticky_session
        , TF.assign "sticky_session_type" <$> TF.argument _sticky_session_type
        , TF.assign "unhealthy_threshold" <$> TF.argument _unhealthy_threshold
        ]

$(TF.makeSchemaLenses
    ''SlbListenerResource
    ''TF.AliCloud
    ''TF.Resource)

slbListenerResource :: TF.Resource TF.AliCloud SlbListenerResource
slbListenerResource =
    TF.newResource "alicloud_slb_listener" $
        SlbListenerResource {
            _backend_port = TF.Nil
            , _bandwidth = TF.Nil
            , _cookie = TF.Nil
            , _cookie_timeout = TF.Nil
            , _frontend_port = TF.Nil
            , _health_check = TF.Nil
            , _health_check_connect_port = TF.Nil
            , _health_check_domain = TF.Nil
            , _health_check_http_code = TF.Nil
            , _health_check_interval = TF.Nil
            , _health_check_timeout = TF.Nil
            , _health_check_type = TF.Nil
            , _health_check_uri = TF.Nil
            , _healthy_threshold = TF.Nil
            , _load_balancer_id = TF.Nil
            , _persistence_timeout = TF.Nil
            , _protocol = TF.Nil
            , _scheduler = TF.Nil
            , _ssl_certificate_id = TF.Nil
            , _sticky_session = TF.Nil
            , _sticky_session_type = TF.Nil
            , _unhealthy_threshold = TF.Nil
            }

{- | The @alicloud_slb@ AliCloud resource.

Provides an Application Load Balancer resource. ~> NOTE: Resource
@alicloud_slb@ has deprecated 'listener' filed from
terraform-alicloud-provider
<https://github.com/alibaba/terraform-provider/releases/tag/V1.3.0> . You
can create new listeners for Load Balancer by resource
@alicloud_slb_listener@ . If you have had several listeners in one load
balancer, you can import them via the specified listener ID. In the
@alicloud_slb_listener@ , listener ID is consist of load balancer ID and
frontend port, and its format is " : ", like "lb-hr2fwnf32t:8080".
-}
data SlbResource = SlbResource {
      _bandwidth                     :: !(TF.Argument Text)
    {- ^ (Optional) Valid value is between 1 and 1000, If argument "internet_charge_type" is "paybytraffic", then this value will be ignore. -}
    , _internet                      :: !(TF.Argument Text)
    {- ^ (Optional, Forces New Resource) If true, the SLB addressType will be internet, false will be intranet, Default is false. If load balancer launched in VPC, this value must be "false". -}
    , _internet_charge_type          :: !(TF.Argument Text)
    {- ^ (Optional, Forces New Resource) Valid values are @paybybandwidth@ , @paybytraffic@ . If this value is "paybybandwidth", then argument "internet" must be "true". Default is "paybytraffic". If load balancer launched in VPC, this value must be "paybytraffic". -}
    , _name                          :: !(TF.Argument Text)
    {- ^ (Optional) The name of the SLB. This name must be unique within your AliCloud account, can have a maximum of 80 characters, must contain only alphanumeric characters or hyphens, such as "-","/",".","_", and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with @tf-lb@ . -}
    , _vswitch_id                    :: !(TF.Argument Text)
    {- ^ (Required for a VPC SLB, Forces New Resource) The VSwitch ID to launch in. -}
    , _computed_address              :: !(TF.Attribute Text)
    {- ^ - The IP address of the load balancer. -}
    , _computed_bandwidth            :: !(TF.Attribute Text)
    {- ^ - The bandwidth of the load balancer. -}
    , _computed_id                   :: !(TF.Attribute Text)
    {- ^ - The ID of the load balancer. -}
    , _computed_internet             :: !(TF.Attribute Text)
    {- ^ - The internet of the load balancer. -}
    , _computed_internet_charge_type :: !(TF.Attribute Text)
    {- ^ - The internet_charge_type of the load balancer. -}
    , _computed_name                 :: !(TF.Attribute Text)
    {- ^ - The name of the load balancer. -}
    , _computed_vswitch_id           :: !(TF.Attribute Text)
    {- ^ - The VSwitch ID of the load balancer. Only available on SLB launched in a VPC. -}
    } deriving (Show, Eq)

instance TF.ToHCL SlbResource where
    toHCL SlbResource{..} = TF.block $ catMaybes
        [ TF.assign "bandwidth" <$> TF.argument _bandwidth
        , TF.assign "internet" <$> TF.argument _internet
        , TF.assign "internet_charge_type" <$> TF.argument _internet_charge_type
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "vswitch_id" <$> TF.argument _vswitch_id
        ]

$(TF.makeSchemaLenses
    ''SlbResource
    ''TF.AliCloud
    ''TF.Resource)

slbResource :: TF.Resource TF.AliCloud SlbResource
slbResource =
    TF.newResource "alicloud_slb" $
        SlbResource {
            _bandwidth = TF.Nil
            , _internet = TF.Nil
            , _internet_charge_type = TF.Nil
            , _name = TF.Nil
            , _vswitch_id = TF.Nil
            , _computed_address = TF.Compute "address"
            , _computed_bandwidth = TF.Compute "bandwidth"
            , _computed_id = TF.Compute "id"
            , _computed_internet = TF.Compute "internet"
            , _computed_internet_charge_type = TF.Compute "internet_charge_type"
            , _computed_name = TF.Compute "name"
            , _computed_vswitch_id = TF.Compute "vswitch_id"
            }

{- | The @alicloud_snat@ AliCloud resource.

Provides a snat resource.
-}
data SnatResource = SnatResource {
      _snat_ip           :: !(TF.Argument Text)
    {- ^ (Required) The SNAT ip address, the ip must along bandwidth package public ip which @alicloud_nat_gateway@ argument @bandwidth_packages@ . -}
    , _snat_table_id     :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The value can get from @alicloud_nat_gateway@ Attributes "snat_table_ids". -}
    , _source_vswitch_id :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The vswitch ID. -}
    } deriving (Show, Eq)

instance TF.ToHCL SnatResource where
    toHCL SnatResource{..} = TF.block $ catMaybes
        [ TF.assign "snat_ip" <$> TF.argument _snat_ip
        , TF.assign "snat_table_id" <$> TF.argument _snat_table_id
        , TF.assign "source_vswitch_id" <$> TF.argument _source_vswitch_id
        ]

$(TF.makeSchemaLenses
    ''SnatResource
    ''TF.AliCloud
    ''TF.Resource)

snatResource :: TF.Resource TF.AliCloud SnatResource
snatResource =
    TF.newResource "alicloud_snat" $
        SnatResource {
            _snat_ip = TF.Nil
            , _snat_table_id = TF.Nil
            , _source_vswitch_id = TF.Nil
            }

{- | The @alicloud_vpc@ AliCloud resource.

Provides a VPC resource. ~> NOTE: Terraform will auto build a router and a
route table while it uses @alicloud_vpc@ to build a vpc resource.
-}
data VpcResource = VpcResource {
      _cidr_block              :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The CIDR block for the VPC. -}
    , _description             :: !(TF.Argument Text)
    {- ^ (Optional) The VPC description. Defaults to null. -}
    , _name                    :: !(TF.Argument Text)
    {- ^ (Optional) The name of the VPC. Defaults to null. -}
    , _computed_cidr_block     :: !(TF.Attribute Text)
    {- ^ - The CIDR block for the VPC. -}
    , _computed_description    :: !(TF.Attribute Text)
    {- ^ - The description of the VPC. -}
    , _computed_id             :: !(TF.Attribute Text)
    {- ^ - The ID of the VPC. -}
    , _computed_name           :: !(TF.Attribute Text)
    {- ^ - The name of the VPC. -}
    , _computed_route_table_id :: !(TF.Attribute Text)
    {- ^ - The route table ID of the router created by default on VPC creation. -}
    , _computed_router_id      :: !(TF.Attribute Text)
    {- ^ - The ID of the router created by default on VPC creation. -}
    } deriving (Show, Eq)

instance TF.ToHCL VpcResource where
    toHCL VpcResource{..} = TF.block $ catMaybes
        [ TF.assign "cidr_block" <$> TF.argument _cidr_block
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "name" <$> TF.argument _name
        ]

$(TF.makeSchemaLenses
    ''VpcResource
    ''TF.AliCloud
    ''TF.Resource)

vpcResource :: TF.Resource TF.AliCloud VpcResource
vpcResource =
    TF.newResource "alicloud_vpc" $
        VpcResource {
            _cidr_block = TF.Nil
            , _description = TF.Nil
            , _name = TF.Nil
            , _computed_cidr_block = TF.Compute "cidr_block"
            , _computed_description = TF.Compute "description"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_route_table_id = TF.Compute "route_table_id"
            , _computed_router_id = TF.Compute "router_id"
            }

{- | The @alicloud_vswitch@ AliCloud resource.

Provides a VPC switch resource.
-}
data VswitchResource = VswitchResource {
      _availability_zone          :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The AZ for the switch. -}
    , _cidr_block                 :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The CIDR block for the switch. -}
    , _description                :: !(TF.Argument Text)
    {- ^ (Optional) The switch description. Defaults to null. -}
    , _name                       :: !(TF.Argument Text)
    {- ^ (Optional) The name of the switch. Defaults to null. -}
    , _vpc_id                     :: !(TF.Argument Text)
    {- ^ (Required, Forces new resource) The VPC ID. -}
    , _computed_availability_zone :: !(TF.Attribute Text)
    {- ^ The AZ for the switch. -}
    , _computed_cidr_block        :: !(TF.Attribute Text)
    {- ^ - The CIDR block for the switch. -}
    , _computed_description       :: !(TF.Attribute Text)
    {- ^ - The description of the switch. -}
    , _computed_id                :: !(TF.Attribute Text)
    {- ^ - The ID of the switch. -}
    , _computed_name              :: !(TF.Attribute Text)
    {- ^ - The name of the switch. -}
    , _computed_vpc_id            :: !(TF.Attribute Text)
    {- ^ - The VPC ID. -}
    } deriving (Show, Eq)

instance TF.ToHCL VswitchResource where
    toHCL VswitchResource{..} = TF.block $ catMaybes
        [ TF.assign "availability_zone" <$> TF.argument _availability_zone
        , TF.assign "cidr_block" <$> TF.argument _cidr_block
        , TF.assign "description" <$> TF.argument _description
        , TF.assign "name" <$> TF.argument _name
        , TF.assign "vpc_id" <$> TF.argument _vpc_id
        ]

$(TF.makeSchemaLenses
    ''VswitchResource
    ''TF.AliCloud
    ''TF.Resource)

vswitchResource :: TF.Resource TF.AliCloud VswitchResource
vswitchResource =
    TF.newResource "alicloud_vswitch" $
        VswitchResource {
            _availability_zone = TF.Nil
            , _cidr_block = TF.Nil
            , _description = TF.Nil
            , _name = TF.Nil
            , _vpc_id = TF.Nil
            , _computed_availability_zone = TF.Compute "availability_zone"
            , _computed_cidr_block = TF.Compute "cidr_block"
            , _computed_description = TF.Compute "description"
            , _computed_id = TF.Compute "id"
            , _computed_name = TF.Compute "name"
            , _computed_vpc_id = TF.Compute "vpc_id"
            }
