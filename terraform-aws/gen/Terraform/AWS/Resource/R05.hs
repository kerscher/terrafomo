-- This module is auto-generated.

{-# LANGUAGE DataKinds              #-}
{-# LANGUAGE DeriveGeneric          #-}
{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleContexts       #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE TemplateHaskell        #-}
{-# LANGUAGE TypeFamilies           #-}

module Terraform.AWS.Resource.R05 where

import Data.Text (Text)

import GHC.Generics (Generic)

import Terraform.AWS.Provider (AWS, newResource)
import Terraform.AWS.Types
import Terraform.Syntax.Attribute (Attr, Computed)

import qualified Terraform.Syntax.TH as TH

-- | The @aws_api_gateway_resource@ Terraform AWS provider resource.
data Api_Gateway_Resource_Resource = Api_Gateway_Resource_Resource
    { parent_id :: !(Attr Text)
      {- ^ (Required) The ID of the parent API resource -}
    , path_part :: !(Attr Text)
      {- ^ (Required) The last path segment of this API resource. -}
    , rest_api_id :: !(Attr Text)
      {- ^ (Required) The ID of the associated REST API -}
    } deriving (Show, Eq, Generic)

type instance Computed Api_Gateway_Resource_Resource
    = '[ '("id", Attr Text)
         {- The resource's identifier. -}
      , '("path", Attr Text)
         {- The complete path for this API resource, including all parent paths. -}
       ]

$(TH.makeResource
    "aws_api_gateway_resource"
    ''AWS
    'newResource
    ''Api_Gateway_Resource_Resource)

-- | The @aws_app_cookie_stickiness_policy@ Terraform AWS provider resource.
data App_Cookie_Stickiness_Policy_Resource = App_Cookie_Stickiness_Policy_Resource
    { cookie_name :: !(Attr Text)
      {- ^ (Required) The application cookie whose lifetime the ELB's cookie should follow. -}
    , lb_port :: !(Attr Text)
      {- ^ (Required) The load balancer port to which the policy should be applied. This must be an active listener on the load balancer. -}
    , load_balancer :: !(Attr Text)
      {- ^ (Required) The name of load balancer to which the policy should be attached. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name of the stickiness policy. -}
    } deriving (Show, Eq, Generic)

type instance Computed App_Cookie_Stickiness_Policy_Resource
    = '[ '("cookie_name", Attr Text)
         {- The application cookie whose lifetime the ELB's cookie should follow. -}
      , '("id", Attr Text)
         {- The ID of the policy. -}
      , '("lb_port", Attr Text)
         {- The load balancer port to which the policy is applied. -}
      , '("load_balancer", Attr Text)
         {- The name of load balancer to which the policy is attached. -}
      , '("name", Attr Text)
         {- The name of the stickiness policy. -}
       ]

$(TH.makeResource
    "aws_app_cookie_stickiness_policy"
    ''AWS
    'newResource
    ''App_Cookie_Stickiness_Policy_Resource)

-- | The @aws_cloudwatch_log_destination@ Terraform AWS provider resource.
data Cloudwatch_Log_Destination_Resource = Cloudwatch_Log_Destination_Resource
    { name :: !(Attr Text)
      {- ^ (Required) A name for the log destination -}
    , role_arn :: !(Attr Text)
      {- ^ (Required) The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to put data into the target -}
    , target_arn :: !(Attr Text)
      {- ^ (Required) The ARN of the target Amazon Kinesis stream or Amazon Lambda resource for the destination -}
    } deriving (Show, Eq, Generic)

type instance Computed Cloudwatch_Log_Destination_Resource
    = '[ '("arn", Attr Text)
         {- The Amazon Resource Name (ARN) specifying the log destination. -}
       ]

$(TH.makeResource
    "aws_cloudwatch_log_destination"
    ''AWS
    'newResource
    ''Cloudwatch_Log_Destination_Resource)

-- | The @aws_codedeploy_deployment_config@ Terraform AWS provider resource.
data Codedeploy_Deployment_Config_Resource = Codedeploy_Deployment_Config_Resource
    { deployment_config_name :: !(Attr Text)
      {- ^ (Required) The name of the deployment config. -}
    , minimum_healthy_hosts :: !(Attr Text)
      {- ^ (Optional) A minimum_healthy_hosts block. Minimum Healthy Hosts are documented below. -}
    } deriving (Show, Eq, Generic)

type instance Computed Codedeploy_Deployment_Config_Resource
    = '[ '("deployment_config_id", Attr Text)
         {- The AWS Assigned deployment config id -}
      , '("id", Attr Text)
         {- The deployment group's config name. -}
       ]

$(TH.makeResource
    "aws_codedeploy_deployment_config"
    ''AWS
    'newResource
    ''Codedeploy_Deployment_Config_Resource)

-- | The @aws_config_configuration_recorder_status@ Terraform AWS provider resource.
data Config_Configuration_Recorder_Status_Resource = Config_Configuration_Recorder_Status_Resource
    { is_enabled :: !(Attr Text)
      {- ^ (Required) Whether the configuration recorder should be enabled or disabled. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name of the recorder -}
    } deriving (Show, Eq, Generic)

type instance Computed Config_Configuration_Recorder_Status_Resource
    = '[]

$(TH.makeResource
    "aws_config_configuration_recorder_status"
    ''AWS
    'newResource
    ''Config_Configuration_Recorder_Status_Resource)

-- | The @aws_elb@ Terraform AWS provider resource.
data Elb_Resource = Elb_Resource
    { access_logs :: !(Attr Text)
      {- ^ (Optional) An Access Logs block. Access Logs documented below. -}
    , availability_zones :: !(Attr Text)
      {- ^ (Required for an EC2-classic ELB) The AZ's to serve traffic in. -}
    , connection_draining :: !(Attr Text)
      {- ^ (Optional) Boolean to enable connection draining. Default:  @false@ -}
    , connection_draining_timeout :: !(Attr Text)
      {- ^ (Optional) The time in seconds to allow for connections to drain. Default:  @300@ -}
    , cross_zone_load_balancing :: !(Attr Text)
      {- ^ (Optional) Enable cross-zone load balancing. Default:  @true@ -}
    , health_check :: !(Attr Text)
      {- ^ (Optional) A health_check block. Health Check documented below. -}
    , idle_timeout :: !(Attr Text)
      {- ^ (Optional) The time in seconds that the connection is allowed to be idle. Default:  @60@ -}
    , instances :: !(Attr Text)
      {- ^ (Optional) A list of instance ids to place in the ELB pool. -}
    , internal :: !(Attr Text)
      {- ^ (Optional) If true, ELB will be an internal ELB. -}
    , listener :: !(Attr Text)
      {- ^ (Required) A list of listener blocks. Listeners documented below. -}
    , name :: !(Attr Text)
      {- ^ (Optional) The name of the ELB. By default generated by Terraform. -}
    , name_prefix :: !(Attr Text)
      {- ^ (Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with  @name@ . -}
    , security_groups :: !(Attr Text)
      {- ^ (Optional) A list of security group IDs to assign to the ELB. Only valid if creating an ELB within a VPC -}
    , subnets :: !(Attr Text)
      {- ^ (Required for a VPC ELB) A list of subnet IDs to attach to the ELB. -}
    , tags :: !(Attr Text)
      {- ^ (Optional) A mapping of tags to assign to the resource. -}
    } deriving (Show, Eq, Generic)

type instance Computed Elb_Resource
    = '[ '("dns_name", Attr Text)
         {- The DNS name of the ELB -}
      , '("id", Attr Text)
         {- The name of the ELB -}
      , '("instances", Attr Text)
         {- The list of instances in the ELB -}
      , '("name", Attr Text)
         {- The name of the ELB -}
      , '("source_security_group", Attr Text)
         {- The name of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances. Use this for Classic or Default VPC only. -}
      , '("source_security_group_id", Attr Text)
         {- The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances. Only available on ELBs launched in a VPC. -}
      , '("zone_id", Attr Text)
         {- The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record) -}
       ]

$(TH.makeResource
    "aws_elb"
    ''AWS
    'newResource
    ''Elb_Resource)

-- | The @aws_emr_security_configuration@ Terraform AWS provider resource.
data Emr_Security_Configuration_Resource = Emr_Security_Configuration_Resource
    { configuration :: !(Attr Text)
      {- ^ (Required) A JSON formatted Security Configuration -}
    , name :: !(Attr Text)
      {- ^ (Optional) The name of the EMR Security Configuration. By default generated by Terraform. -}
    , name_prefix :: !(Attr Text)
      {- ^ (Optional) Creates a unique name beginning with the specified prefix. Conflicts with  @name@ . -}
    } deriving (Show, Eq, Generic)

type instance Computed Emr_Security_Configuration_Resource
    = '[ '("configuration", Attr Text)
         {- The JSON formatted Security Configuration -}
      , '("creation_date", Attr Text)
         {- Date the Security Configuration was created -}
      , '("id", Attr Text)
         {- The ID of the EMR Security Configuration (Same as the  @name@ ) -}
      , '("name", Attr Text)
         {- The Name of the EMR Security Configuration -}
       ]

$(TH.makeResource
    "aws_emr_security_configuration"
    ''AWS
    'newResource
    ''Emr_Security_Configuration_Resource)

-- | The @aws_flow_log@ Terraform AWS provider resource.
data Flow_Log_Resource = Flow_Log_Resource
    { eni_id :: !(Attr Text)
      {- ^ (Optional) Elastic Network Interface ID to attach to -}
    , iam_role_arn :: !(Attr Text)
      {- ^ (Required) The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group -}
    , log_group_name :: !(Attr Text)
      {- ^ (Required) The name of the CloudWatch log group -}
    , subnet_id :: !(Attr Text)
      {- ^ (Optional) Subnet ID to attach to -}
    , traffic_type :: !(Attr Text)
      {- ^ (Required) The type of traffic to capture. Valid values: @ACCEPT@ , @REJECT@ ,  @ALL@ -}
    , vpc_id :: !(Attr Text)
      {- ^ (Optional) VPC ID to attach to -}
    } deriving (Show, Eq, Generic)

type instance Computed Flow_Log_Resource
    = '[ '("id", Attr Text)
         {- The Flow Log ID -}
       ]

$(TH.makeResource
    "aws_flow_log"
    ''AWS
    'newResource
    ''Flow_Log_Resource)

-- | The @aws_iam_user_login_profile@ Terraform AWS provider resource.
data Iam_User_Login_Profile_Resource = Iam_User_Login_Profile_Resource
    { password_length :: !(Attr Text)
      {- ^ (Optional, default 20) The length of the generated password. -}
    , password_reset_required :: !(Attr Text)
      {- ^ (Optional, default "true") Whether the user should be forced to reset the generated password on first login. -}
    , pgp_key :: !(Attr Text)
      {- ^ (Required) Either a base-64 encoded PGP public key, or a keybase username in the form  @keybase:username@ . -}
    , user :: !(Attr Text)
      {- ^ (Required) The IAM user's name. -}
    } deriving (Show, Eq, Generic)

type instance Computed Iam_User_Login_Profile_Resource
    = '[ '("encrypted_password", Attr Text)
         {- The encrypted password, base64 encoded. -}
      , '("key_fingerprint", Attr Text)
         {- The fingerprint of the PGP key used to encrypt the password -}
       ]

$(TH.makeResource
    "aws_iam_user_login_profile"
    ''AWS
    'newResource
    ''Iam_User_Login_Profile_Resource)

-- | The @aws_iam_user_ssh_key@ Terraform AWS provider resource.
data Iam_User_Ssh_Key_Resource = Iam_User_Ssh_Key_Resource
    { encoding :: !(Attr Text)
      {- ^ (Required) Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH . To retrieve the public key in PEM format, use PEM . -}
    , public_key :: !(Attr Text)
      {- ^ (Required) The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. -}
    , status :: !(Attr Text)
      {- ^ (Optional) The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is  @active@ . -}
    , username :: !(Attr Text)
      {- ^ (Required) The name of the IAM user to associate the SSH public key with. -}
    } deriving (Show, Eq, Generic)

type instance Computed Iam_User_Ssh_Key_Resource
    = '[ '("fingerprint", Attr Text)
         {- The MD5 message digest of the SSH public key. -}
      , '("ssh_public_key_id", Attr Text)
         {- The unique identifier for the SSH public key. -}
       ]

$(TH.makeResource
    "aws_iam_user_ssh_key"
    ''AWS
    'newResource
    ''Iam_User_Ssh_Key_Resource)

-- | The @aws_iot_certificate@ Terraform AWS provider resource.
data Iot_Certificate_Resource = Iot_Certificate_Resource
    { active :: !(Attr Text)
      {- ^ (Required)  Boolean flag to indicate if the certificate should be active -}
    , csr :: !(Attr Text)
      {- ^ (Required) The certificate signing request. Review the [IoT API Reference Guide] (http://docs.aws.amazon.com/iot/latest/apireference/API_CreateCertificateFromCsr.html) for more information on creating a certificate from a certificate signing request (CSR). -}
    } deriving (Show, Eq, Generic)

type instance Computed Iot_Certificate_Resource
    = '[ '("arn", Attr Text)
         {- The ARN of the created AWS IoT certificate -}
       ]

$(TH.makeResource
    "aws_iot_certificate"
    ''AWS
    'newResource
    ''Iot_Certificate_Resource)

-- | The @aws_lb_listener@ Terraform AWS provider resource.
data Lb_Listener_Resource = Lb_Listener_Resource
    { certificate_arn :: !(Attr Text)
      {- ^ (Optional) The ARN of the SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. -}
    , default_action :: !(Attr Text)
      {- ^ (Required) An Action block. Action blocks are documented below. -}
    , load_balancer_arn :: !(Attr Text)
      {- ^ (Required, Forces New Resource) The ARN of the load balancer. -}
    , port :: !(Attr Text)
      {- ^ (Required) The port on which the load balancer is listening. -}
    , protocol :: !(Attr Text)
      {- ^ (Optional) The protocol for connections from clients to the load balancer. Valid values are  @TCP@ ,  @HTTP@  and  @HTTPS@ . Defaults to  @HTTP@ . -}
    , ssl_policy :: !(Attr Text)
      {- ^ (Optional) The name of the SSL Policy for the listener. Required if  @protocol@  is  @HTTPS@ . -}
    } deriving (Show, Eq, Generic)

type instance Computed Lb_Listener_Resource
    = '[ '("arn", Attr Text)
         {- The ARN of the listener (matches  @id@ ) -}
      , '("id", Attr Text)
         {- The ARN of the listener (matches  @arn@ ) -}
       ]

$(TH.makeResource
    "aws_lb_listener"
    ''AWS
    'newResource
    ''Lb_Listener_Resource)

-- | The @aws_lightsail_domain@ Terraform AWS provider resource.
data Lightsail_Domain_Resource = Lightsail_Domain_Resource
    { domain_name :: !(Attr Text)
      {- ^ (Required) The name of the Lightsail domain to manage -}
    } deriving (Show, Eq, Generic)

type instance Computed Lightsail_Domain_Resource
    = '[ '("arn", Attr Text)
         {- The ARN of the Lightsail domain -}
      , '("id", Attr Text)
         {- The name used for this domain -}
       ]

$(TH.makeResource
    "aws_lightsail_domain"
    ''AWS
    'newResource
    ''Lightsail_Domain_Resource)

-- | The @aws_opsworks_mysql_layer@ Terraform AWS provider resource.
data Opsworks_Mysql_Layer_Resource = Opsworks_Mysql_Layer_Resource
    { auto_assign_elastic_ips :: !(Attr Text)
      {- ^ (Optional) Whether to automatically assign an elastic IP address to the layer's instances. -}
    , auto_assign_public_ips :: !(Attr Text)
      {- ^ (Optional) For stacks belonging to a VPC, whether to automatically assign a public IP address to each of the layer's instances. -}
    , auto_healing :: !(Attr Text)
      {- ^ (Optional) Whether to enable auto-healing for the layer. -}
    , custom_instance_profile_arn :: !(Attr Text)
      {- ^ (Optional) The ARN of an IAM profile that will be used for the layer's instances. -}
    , custom_json :: !(Attr Text)
      {- ^ (Optional) Custom JSON attributes to apply to the layer. -}
    , custom_security_group_ids :: !(Attr Text)
      {- ^ (Optional) Ids for a set of security groups to apply to the layer's instances. -}
    , drain_elb_on_shutdown :: !(Attr Text)
      {- ^ (Optional) Whether to enable Elastic Load Balancing connection draining. -}
    , ebs_volume :: !(Attr Text)
      {- ^ (Optional)  @ebs_volume@  blocks, as described below, will each create an EBS volume and connect it to the layer's instances. -}
    , elastic_load_balancer :: !(Attr Text)
      {- ^ (Optional) Name of an Elastic Load Balancer to attach to this layer -}
    , install_updates_on_boot :: !(Attr Text)
      {- ^ (Optional) Whether to install OS and package updates on each instance when it boots. -}
    , instance_shutdown_timeout :: !(Attr Text)
      {- ^ (Optional) The time, in seconds, that OpsWorks will wait for Chef to complete after triggering the Shutdown event. -}
    , name :: !(Attr Text)
      {- ^ (Optional) A human-readable name for the layer. -}
    , root_password :: !(Attr Text)
      {- ^ (Optional) Root password to use for MySQL. -}
    , root_password_on_all_instances :: !(Attr Text)
      {- ^ (Optional) Whether to set the root user password to all instances in the stack so they can access the instances in this layer. -}
    , stack_id :: !(Attr Text)
      {- ^ (Required) The id of the stack the layer will belong to. -}
    , system_packages :: !(Attr Text)
      {- ^ (Optional) Names of a set of system packages to install on the layer's instances. -}
    , use_ebs_optimized_instances :: !(Attr Text)
      {- ^ (Optional) Whether to use EBS-optimized instances. -}
    } deriving (Show, Eq, Generic)

type instance Computed Opsworks_Mysql_Layer_Resource
    = '[ '("id", Attr Text)
         {- The id of the layer. -}
       ]

$(TH.makeResource
    "aws_opsworks_mysql_layer"
    ''AWS
    'newResource
    ''Opsworks_Mysql_Layer_Resource)

-- | The @aws_opsworks_rails_app_layer@ Terraform AWS provider resource.
data Opsworks_Rails_App_Layer_Resource = Opsworks_Rails_App_Layer_Resource
    { app_server :: !(Attr Text)
      {- ^ (Optional) Keyword for the app server to use. Defaults to "apache_passenger". -}
    , auto_assign_elastic_ips :: !(Attr Text)
      {- ^ (Optional) Whether to automatically assign an elastic IP address to the layer's instances. -}
    , auto_assign_public_ips :: !(Attr Text)
      {- ^ (Optional) For stacks belonging to a VPC, whether to automatically assign a public IP address to each of the layer's instances. -}
    , auto_healing :: !(Attr Text)
      {- ^ (Optional) Whether to enable auto-healing for the layer. -}
    , bundler_version :: !(Attr Text)
      {- ^ (Optional) When OpsWorks is managing Bundler, which version to use. Defaults to "1.5.3". -}
    , custom_instance_profile_arn :: !(Attr Text)
      {- ^ (Optional) The ARN of an IAM profile that will be used for the layer's instances. -}
    , custom_json :: !(Attr Text)
      {- ^ (Optional) Custom JSON attributes to apply to the layer. -}
    , custom_security_group_ids :: !(Attr Text)
      {- ^ (Optional) Ids for a set of security groups to apply to the layer's instances. -}
    , drain_elb_on_shutdown :: !(Attr Text)
      {- ^ (Optional) Whether to enable Elastic Load Balancing connection draining. -}
    , ebs_volume :: !(Attr Text)
      {- ^ (Optional)  @ebs_volume@  blocks, as described below, will each create an EBS volume and connect it to the layer's instances. -}
    , elastic_load_balancer :: !(Attr Text)
      {- ^ (Optional) Name of an Elastic Load Balancer to attach to this layer -}
    , install_updates_on_boot :: !(Attr Text)
      {- ^ (Optional) Whether to install OS and package updates on each instance when it boots. -}
    , instance_shutdown_timeout :: !(Attr Text)
      {- ^ (Optional) The time, in seconds, that OpsWorks will wait for Chef to complete after triggering the Shutdown event. -}
    , manage_bundler :: !(Attr Text)
      {- ^ (Optional) Whether OpsWorks should manage bundler. On by default. -}
    , name :: !(Attr Text)
      {- ^ (Optional) A human-readable name for the layer. -}
    , passenger_version :: !(Attr Text)
      {- ^ (Optional) The version of Passenger to use. Defaults to "4.0.46". -}
    , ruby_version :: !(Attr Text)
      {- ^ (Optional) The version of Ruby to use. Defaults to "2.0.0". -}
    , rubygems_version :: !(Attr Text)
      {- ^ (Optional) The version of RubyGems to use. Defaults to "2.2.2". -}
    , stack_id :: !(Attr Text)
      {- ^ (Required) The id of the stack the layer will belong to. -}
    , system_packages :: !(Attr Text)
      {- ^ (Optional) Names of a set of system packages to install on the layer's instances. -}
    , use_ebs_optimized_instances :: !(Attr Text)
      {- ^ (Optional) Whether to use EBS-optimized instances. -}
    } deriving (Show, Eq, Generic)

type instance Computed Opsworks_Rails_App_Layer_Resource
    = '[ '("id", Attr Text)
         {- The id of the layer. -}
       ]

$(TH.makeResource
    "aws_opsworks_rails_app_layer"
    ''AWS
    'newResource
    ''Opsworks_Rails_App_Layer_Resource)

-- | The @aws_opsworks_rds_db_instance@ Terraform AWS provider resource.
data Opsworks_Rds_Db_Instance_Resource = Opsworks_Rds_Db_Instance_Resource
    { db_password :: !(Attr Text)
      {- ^ (Required) A db password -}
    , db_user :: !(Attr Text)
      {- ^ (Required) A db username -}
    , rds_db_instance_arn :: !(Attr Text)
      {- ^ (Required) The db instance to register for this stack. Changing this will force a new resource. -}
    , stack_id :: !(Attr Text)
      {- ^ (Required) The stack to register a db inatance for. Changing this will force a new resource. -}
    } deriving (Show, Eq, Generic)

type instance Computed Opsworks_Rds_Db_Instance_Resource
    = '[ '("id", Attr Text)
         {- The computed id. Please note that this is only used internally to identify the stack <-> instance relation. This value is not used in aws. -}
       ]

$(TH.makeResource
    "aws_opsworks_rds_db_instance"
    ''AWS
    'newResource
    ''Opsworks_Rds_Db_Instance_Resource)

-- | The @aws_opsworks_stack@ Terraform AWS provider resource.
data Opsworks_Stack_Resource = Opsworks_Stack_Resource
    { agent_version :: !(Attr Text)
      {- ^ (Optional) If set to  @"LATEST"@ , OpsWorks will automatically install the latest version. -}
    , berkshelf_version :: !(Attr Text)
      {- ^ (Optional) If  @manage_berkshelf@  is enabled, the version of Berkshelf to use. -}
    , color :: !(Attr Text)
      {- ^ (Optional) Color to paint next to the stack's resources in the OpsWorks console. -}
    , configuration_manager_name :: !(Attr Text)
      {- ^ (Optional) Name of the configuration manager to use. Defaults to "Chef". -}
    , configuration_manager_version :: !(Attr Text)
      {- ^ (Optional) Version of the configuration manager to use. Defaults to "11.4". -}
    , custom_cookbooks_source :: !(Attr Text)
      {- ^ (Optional) When  @use_custom_cookbooks@  is set, provide this sub-object as described below. -}
    , custom_json :: !(Attr Text)
      {- ^ (Optional) Custom JSON attributes to apply to the entire stack. -}
    , default_availability_zone :: !(Attr Text)
      {- ^ (Optional) Name of the availability zone where instances will be created by default. This is required unless you set  @vpc_id@ . -}
    , default_instance_profile_arn :: !(Attr Text)
      {- ^ (Required) The ARN of an IAM Instance Profile that created instances will have by default. -}
    , default_os :: !(Attr Text)
      {- ^ (Optional) Name of OS that will be installed on instances by default. -}
    , default_root_device_type :: !(Attr Text)
      {- ^ (Optional) Name of the type of root device instances will have by default. -}
    , default_ssh_key_name :: !(Attr Text)
      {- ^ (Optional) Name of the SSH keypair that instances will have by default. -}
    , default_subnet_id :: !(Attr Text)
      {- ^ (Optional) Id of the subnet in which instances will be created by default. Mandatory if  @vpc_id@  is set, and forbidden if it isn't. -}
    , hostname_theme :: !(Attr Text)
      {- ^ (Optional) Keyword representing the naming scheme that will be used for instance hostnames within this stack. -}
    , manage_berkshelf :: !(Attr Text)
      {- ^ (Optional) Boolean value controlling whether Opsworks will run Berkshelf for this stack. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name of the stack. -}
    , region :: !(Attr Text)
      {- ^ (Required) The name of the region where the stack will exist. -}
    , service_role_arn :: !(Attr Text)
      {- ^ (Required) The ARN of an IAM role that the OpsWorks service will act as. -}
    , tags :: !(Attr Text)
      {- ^ (Optional) A mapping of tags to assign to the resource. -}
    , use_custom_cookbooks :: !(Attr Text)
      {- ^ (Optional) Boolean value controlling whether the custom cookbook settings are enabled. -}
    , use_opsworks_security_groups :: !(Attr Text)
      {- ^ (Optional) Boolean value controlling whether the standard OpsWorks security groups apply to created instances. -}
    , vpc_id :: !(Attr Text)
      {- ^ (Optional) The id of the VPC that this stack belongs to. -}
    } deriving (Show, Eq, Generic)

type instance Computed Opsworks_Stack_Resource
    = '[ '("id", Attr Text)
         {- The id of the stack. -}
       ]

$(TH.makeResource
    "aws_opsworks_stack"
    ''AWS
    'newResource
    ''Opsworks_Stack_Resource)

-- | The @aws_redshift_cluster@ Terraform AWS provider resource.
data Redshift_Cluster_Resource = Redshift_Cluster_Resource
    { allow_version_upgrade :: !(Attr Text)
      {- ^ (Optional) If true , major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster. Default is true -}
    , automated_snapshot_retention_period :: !(Attr Text)
      {- ^ (Optional) The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with create-cluster-snapshot. Default is 1. -}
    , availability_zone :: !(Attr Text)
      {- ^ (Optional) The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster. For example, if you have several EC2 instances running in a specific Availability Zone, then you might want the cluster to be provisioned in the same zone in order to decrease network latency. -}
    , bucket_name :: !(Attr Text)
      {- ^ (Optional, required when  @enable_logging@  is  @true@ ) The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions. For more information on the permissions required for the bucket, please read the AWS  <http://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html#db-auditing-enable-logging> -}
    , cluster_identifier :: !(Attr Text)
      {- ^ (Required) The Cluster Identifier. Must be a lower case string. -}
    , cluster_parameter_group_name :: !(Attr Text)
      {- ^ (Optional) The name of the parameter group to be associated with this cluster. -}
    , cluster_security_groups :: !(Attr Text)
      {- ^ (Optional) A list of security groups to be associated with this cluster. -}
    , cluster_subnet_group_name :: !(Attr Text)
      {- ^ (Optional) The name of a cluster subnet group to be associated with this cluster. If this parameter is not provided the resulting cluster will be deployed outside virtual private cloud (VPC). -}
    , cluster_type :: !(Attr Text)
      {- ^ (Optional) The cluster type to use. Either  @single-node@  or  @multi-node@ . -}
    , cluster_version :: !(Attr Text)
      {- ^ (Optional) The version of the Amazon Redshift engine software that you want to deploy on the cluster. The version selected runs on all the nodes in the cluster. -}
    , database_name :: !(Attr Text)
      {- ^ (Optional) The name of the first database to be created when the cluster is created. If you do not provide a name, Amazon Redshift will create a default database called  @dev@ . -}
    , elastic_ip :: !(Attr Text)
      {- ^ (Optional) The Elastic IP (EIP) address for the cluster. -}
    , enable_logging :: !(Attr Text)
      {- ^ (Optional) Enables logging information such as queries and connection attempts, for the specified Amazon Redshift cluster. Defaults to  @false@ . -}
    , encrypted :: !(Attr Text)
      {- ^ (Optional) If true , the data in the cluster is encrypted at rest. -}
    , enhanced_vpc_routing :: !(Attr Text)
      {- ^ (Optional) If true , enhanced VPC routing is enabled. -}
    , final_snapshot_identifier :: !(Attr Text)
      {- ^ (Optional) The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided,  @skip_final_snapshot@  must be false. -}
    , iam_roles :: !(Attr Text)
      {- ^ (Optional) A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time. -}
    , kms_key_id :: !(Attr Text)
      {- ^ (Optional) The ARN for the KMS encryption key. When specifying  @kms_key_id@ ,  @encrypted@  needs to be set to true. -}
    , master_password :: !(Attr Text)
      {- ^ (Required unless a  @snapshot_identifier@  is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Password must contain at least 8 chars and contain at least one uppercase letter, one lowercase letter, and one number. -}
    , master_username :: !(Attr Text)
      {- ^ (Required unless a  @snapshot_identifier@  is provided) Username for the master DB user. -}
    , node_type :: !(Attr Text)
      {- ^ (Required) The node type to be provisioned for the cluster. -}
    , number_of_nodes :: !(Attr Text)
      {- ^ (Optional) The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node. Default is 1. -}
    , owner_account :: !(Attr Text)
      {- ^ (Optional) The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot. -}
    , port :: !(Attr Text)
      {- ^ (Optional) The port number on which the cluster accepts incoming connections. The cluster is accessible only via the JDBC and ODBC connection strings. Part of the connection string requires the port on which the cluster will listen for incoming connections. Default port is 5439. -}
    , preferred_maintenance_window :: !(Attr Text)
      {- ^ (Optional) The weekly time range (in UTC) during which automated cluster maintenance can occur. Format: ddd:hh24:mi-ddd:hh24:mi -}
    , publicly_accessible :: !(Attr Text)
      {- ^ (Optional) If true, the cluster can be accessed from a public network. Default is  @true@ . -}
    , s3_key_prefix :: !(Attr Text)
      {- ^ (Optional) The prefix applied to the log file names. -}
    , skip_final_snapshot :: !(Attr Text)
      {- ^ (Optional) Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. If true , a final cluster snapshot is not created. If false , a final cluster snapshot is created before the cluster is deleted. Default is false. -}
    , snapshot_cluster_identifier :: !(Attr Text)
      {- ^ (Optional) The name of the cluster the source snapshot was created from. -}
    , snapshot_identifier :: !(Attr Text)
      {- ^ (Optional) The name of the snapshot from which to create the new cluster. -}
    , tags :: !(Attr Text)
      {- ^ (Optional) A mapping of tags to assign to the resource. -}
    , vpc_security_group_ids :: !(Attr Text)
      {- ^ (Optional) A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster. -}
    } deriving (Show, Eq, Generic)

type instance Computed Redshift_Cluster_Resource
    = '[ '("automated_snapshot_retention_period", Attr Text)
         {- The backup retention period -}
      , '("availability_zone", Attr Text)
         {- The availability zone of the Cluster -}
      , '("cluster_identifier", Attr Text)
         {- The Cluster Identifier -}
      , '("cluster_parameter_group_name", Attr Text)
         {- The name of the parameter group to be associated with this cluster -}
      , '("cluster_public_key", Attr Text)
         {- The public key for the cluster -}
      , '("cluster_revision_number", Attr Text)
         {- The specific revision number of the database in the cluster -}
      , '("cluster_security_groups", Attr Text)
         {- The security groups associated with the cluster -}
      , '("cluster_subnet_group_name", Attr Text)
         {- The name of a cluster subnet group to be associated with this cluster -}
      , '("cluster_type", Attr Text)
         {- The cluster type -}
      , '("cluster_version", Attr Text)
         {- The version of Redshift engine software -}
      , '("database_name", Attr Text)
         {- The name of the default database in the Cluster -}
      , '("encrypted", Attr Text)
         {- Whether the data in the cluster is encrypted -}
      , '("endpoint", Attr Text)
         {- The connection endpoint -}
      , '("id", Attr Text)
         {- The Redshift Cluster ID. -}
      , '("node_type", Attr Text)
         {- The type of nodes in the cluster -}
      , '("port", Attr Text)
         {- The Port the cluster responds on -}
      , '("preferred_maintenance_window", Attr Text)
         {- The backup window -}
      , '("vpc_security_group_ids", Attr Text)
         {- The VPC security group Ids associated with the cluster -}
       ]

$(TH.makeResource
    "aws_redshift_cluster"
    ''AWS
    'newResource
    ''Redshift_Cluster_Resource)

-- | The @aws_route@ Terraform AWS provider resource.
data Route_Resource = Route_Resource
    { destination_cidr_block :: !(Attr Text)
      {- ^ (Optional) The destination CIDR block. -}
    , destination_ipv6_cidr_block :: !(Attr Text)
      {- ^ (Optional) The destination IPv6 CIDR block. -}
    , egress_only_gateway_id :: !(Attr Text)
      {- ^ (Optional) An ID of a VPC Egress Only Internet Gateway. -}
    , gateway_id :: !(Attr Text)
      {- ^ (Optional) An ID of a VPC internet gateway or a virtual private gateway. -}
    , instance_id :: !(Attr Text)
      {- ^ (Optional) An ID of an EC2 instance. -}
    , nat_gateway_id :: !(Attr Text)
      {- ^ (Optional) An ID of a VPC NAT gateway. -}
    , network_interface_id :: !(Attr Text)
      {- ^ (Optional) An ID of a network interface. -}
    , route_table_id :: !(Attr Text)
      {- ^ (Required) The ID of the routing table. -}
    , vpc_peering_connection_id :: !(Attr Text)
      {- ^ (Optional) An ID of a VPC peering connection. -}
    } deriving (Show, Eq, Generic)

type instance Computed Route_Resource
    = '[ '("destination_cidr_block", Attr Text)
         {- The destination CIDR block. -}
      , '("destination_ipv6_cidr_block", Attr Text)
         {- The destination IPv6 CIDR block. -}
      , '("egress_only_gateway_id", Attr Text)
         {- An ID of a VPC Egress Only Internet Gateway. -}
      , '("gateway_id", Attr Text)
         {- An ID of a VPC internet gateway or a virtual private gateway. -}
      , '("instance_id", Attr Text)
         {- An ID of a NAT instance. -}
      , '("nat_gateway_id", Attr Text)
         {- An ID of a VPC NAT gateway. -}
      , '("network_interface_id", Attr Text)
         {- An ID of a network interface. -}
      , '("route_table_id", Attr Text)
         {- The ID of the routing table. -}
      , '("vpc_peering_connection_id", Attr Text)
         {- An ID of a VPC peering connection. -}
       ]

$(TH.makeResource
    "aws_route"
    ''AWS
    'newResource
    ''Route_Resource)

-- | The @aws_sqs_queue@ Terraform AWS provider resource.
data Sqs_Queue_Resource = Sqs_Queue_Resource
    { content_based_deduplication :: !(Attr Text)
      {- ^ (Optional) Enables content-based deduplication for FIFO queues. For more information, see the  <http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing> -}
    , delay_seconds :: !(Attr Text)
      {- ^ (Optional) The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds. -}
    , fifo_queue :: !(Attr Text)
      {- ^ (Optional) Boolean designating a FIFO queue. If not set, it defaults to  @false@  making it standard. -}
    , kms_data_key_reuse_period_seconds :: !(Attr Text)
      {- ^ (Optional) The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes). -}
    , kms_master_key_id :: !(Attr Text)
      {- ^ (Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see  <http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms> . -}
    , max_message_size :: !(Attr Text)
      {- ^ (Optional) The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB). -}
    , message_retention_seconds :: !(Attr Text)
      {- ^ (Optional) The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days). -}
    , name :: !(Attr Text)
      {- ^ (Optional) This is the human-readable name of the queue. If omitted, Terraform will assign a random name. -}
    , name_prefix :: !(Attr Text)
      {- ^ (Optional) Creates a unique name beginning with the specified prefix. Conflicts with  @name@ . -}
    , policy :: !(Attr Text)
      {- ^ (Optional) The JSON policy for the SQS queue -}
    , receive_wait_time_seconds :: !(Attr Text)
      {- ^ (Optional) The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately. -}
    , redrive_policy :: !(Attr Text)
      {- ^ (Optional) The JSON policy to set up the Dead Letter Queue, see  <https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html> .   when specifying  @maxReceiveCount@ , you must specify it as an integer ( @5@ ), and not a string ( @"5"@ ). -}
    , tags :: !(Attr Text)
      {- ^ (Optional) A mapping of tags to assign to the queue. -}
    , visibility_timeout_seconds :: !(Attr Text)
      {- ^ (Optional) The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see  <https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html> . -}
    } deriving (Show, Eq, Generic)

type instance Computed Sqs_Queue_Resource
    = '[ '("arn", Attr Text)
         {- The ARN of the SQS queue -}
      , '("id", Attr Text)
         {- The URL for the created Amazon SQS queue. -}
       ]

$(TH.makeResource
    "aws_sqs_queue"
    ''AWS
    'newResource
    ''Sqs_Queue_Resource)

-- | The @aws_ssm_maintenance_window@ Terraform AWS provider resource.
data Ssm_Maintenance_Window_Resource = Ssm_Maintenance_Window_Resource
    { allow_unassociated_targets :: !(Attr Text)
      {- ^ (Optional) Whether targets must be registered with the Maintenance Window before tasks can be defined for those targets. -}
    , cutoff :: !(Attr Text)
      {- ^ (Required) The number of hours before the end of the Maintenance Window that Systems Manager stops scheduling new tasks for execution. -}
    , duration :: !(Attr Text)
      {- ^ (Required) The duration of the Maintenance Window in hours. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name of the maintenance window. -}
    , schedule :: !(Attr Text)
      {- ^ (Required) The schedule of the Maintenance Window in the form of a  <https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-cron.html>  or rate expression. -}
    } deriving (Show, Eq, Generic)

type instance Computed Ssm_Maintenance_Window_Resource
    = '[ '("id", Attr Text)
         {- The ID of the maintenance window. -}
       ]

$(TH.makeResource
    "aws_ssm_maintenance_window"
    ''AWS
    'newResource
    ''Ssm_Maintenance_Window_Resource)

-- | The @aws_ssm_maintenance_window_target@ Terraform AWS provider resource.
data Ssm_Maintenance_Window_Target_Resource = Ssm_Maintenance_Window_Target_Resource
    { owner_information :: !(Attr Text)
      {- ^ (Optional) User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this Maintenance Window. -}
    , resource_type :: !(Attr Text)
      {- ^ (Required) The type of target being registered with the Maintenance Window. Possible values  @INSTANCE@ . -}
    , targets :: !(Attr Text)
      {- ^ (Required) The targets (either instances or tags). Instances are specified using Key=instanceids,Values=instanceid1,instanceid2. Tags are specified using Key=tag name,Values=tag value. -}
    , window_id :: !(Attr Text)
      {- ^ (Required) The Id of the maintenance window to register the target with. -}
    } deriving (Show, Eq, Generic)

type instance Computed Ssm_Maintenance_Window_Target_Resource
    = '[ '("id", Attr Text)
         {- The ID of the maintenance window target. -}
       ]

$(TH.makeResource
    "aws_ssm_maintenance_window_target"
    ''AWS
    'newResource
    ''Ssm_Maintenance_Window_Target_Resource)

-- | The @aws_ssm_maintenance_window_task@ Terraform AWS provider resource.
data Ssm_Maintenance_Window_Task_Resource = Ssm_Maintenance_Window_Task_Resource
    { logging_info :: !(Attr Text)
      {- ^ (Optional) A structure containing information about an Amazon S3 bucket to write instance-level logs to. Documented below. -}
    , max_concurrency :: !(Attr Text)
      {- ^ (Required) The maximum number of targets this task can be run for in parallel. -}
    , max_errors :: !(Attr Text)
      {- ^ (Required) The maximum number of errors allowed before this task stops being scheduled. -}
    , priority :: !(Attr Text)
      {- ^ (Optional) The priority of the task in the Maintenance Window, the lower the number the higher the priority. Tasks in a Maintenance Window are scheduled in priority order with tasks that have the same priority scheduled in parallel. -}
    , service_role_arn :: !(Attr Text)
      {- ^ (Required) The role that should be assumed when executing the task. -}
    , targets :: !(Attr Text)
      {- ^ (Required) The targets (either instances or window target ids). Instances are specified using Key=InstanceIds,Values=instanceid1,instanceid2. Window target ids are specified using Key=WindowTargetIds,Values=window target id1, window target id2. -}
    , task_arn :: !(Attr Text)
      {- ^ (Required) The ARN of the task to execute. -}
    , task_parameters :: !(Attr Text)
      {- ^ (Optional) A structure containing information about parameters required by the particular  @task_arn@ . Documented below. -}
    , task_type :: !(Attr Text)
      {- ^ (Required) The type of task being registered. The only allowed value is  @RUN_COMMAND@ . -}
    , window_id :: !(Attr Text)
      {- ^ (Required) The Id of the maintenance window to register the task with. -}
    } deriving (Show, Eq, Generic)

type instance Computed Ssm_Maintenance_Window_Task_Resource
    = '[ '("id", Attr Text)
         {- The ID of the maintenance window task. -}
       ]

$(TH.makeResource
    "aws_ssm_maintenance_window_task"
    ''AWS
    'newResource
    ''Ssm_Maintenance_Window_Task_Resource)

-- | The @aws_vpn_gateway_attachment@ Terraform AWS provider resource.
data Vpn_Gateway_Attachment_Resource = Vpn_Gateway_Attachment_Resource
    { vpc_id :: !(Attr Text)
      {- ^ (Required) The ID of the VPC. -}
    , vpn_gateway_id :: !(Attr Text)
      {- ^ (Required) The ID of the Virtual Private Gateway. -}
    } deriving (Show, Eq, Generic)

type instance Computed Vpn_Gateway_Attachment_Resource
    = '[ '("vpc_id", Attr Text)
         {- The ID of the VPC that Virtual Private Gateway is attached to. -}
      , '("vpn_gateway_id", Attr Text)
         {- The ID of the Virtual Private Gateway. -}
       ]

$(TH.makeResource
    "aws_vpn_gateway_attachment"
    ''AWS
    'newResource
    ''Vpn_Gateway_Attachment_Resource)

-- | The @aws_waf_byte_match_set@ Terraform AWS provider resource.
data Waf_Byte_Match_Set_Resource = Waf_Byte_Match_Set_Resource
    { byte_match_tuples :: !(Attr Text)
      {- ^  - Specifies the bytes (typically a string that corresponds with ASCII characters) that you want to search for in web requests, the location in requests that you want to search, and other settings. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name or description of the Byte Match Set. -}
    } deriving (Show, Eq, Generic)

type instance Computed Waf_Byte_Match_Set_Resource
    = '[ '("id", Attr Text)
         {- The ID of the WAF Byte Match Set. -}
       ]

$(TH.makeResource
    "aws_waf_byte_match_set"
    ''AWS
    'newResource
    ''Waf_Byte_Match_Set_Resource)

-- | The @aws_waf_ipset@ Terraform AWS provider resource.
data Waf_Ipset_Resource = Waf_Ipset_Resource
    { ip_set_descriptors :: !(Attr Text)
      {- ^ (Optional) Specifies the IP address type (IPV4 or IPV6) and the IP address range (in CIDR format) that web requests originate from. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name or description of the IPSet. -}
    } deriving (Show, Eq, Generic)

type instance Computed Waf_Ipset_Resource
    = '[ '("id", Attr Text)
         {- The ID of the WAF IPSet. -}
       ]

$(TH.makeResource
    "aws_waf_ipset"
    ''AWS
    'newResource
    ''Waf_Ipset_Resource)

-- | The @aws_waf_rule@ Terraform AWS provider resource.
data Waf_Rule_Resource = Waf_Rule_Resource
    { metric_name :: !(Attr Text)
      {- ^ (Required) The name or description for the Amazon CloudWatch metric of this rule. -}
    , name :: !(Attr Text)
      {- ^ (Required) The name or description of the rule. -}
    , predicates :: !(Attr Text)
      {- ^ (Optional) One of ByteMatchSet, IPSet, SizeConstraintSet, SqlInjectionMatchSet, or XssMatchSet objects to include in a rule. -}
    } deriving (Show, Eq, Generic)

type instance Computed Waf_Rule_Resource
    = '[ '("id", Attr Text)
         {- The ID of the WAF rule. -}
       ]

$(TH.makeResource
    "aws_waf_rule"
    ''AWS
    'newResource
    ''Waf_Rule_Resource)