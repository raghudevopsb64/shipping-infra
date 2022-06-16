module "vpc" {
  source         = "git::https://github.com/raghudevopsb64/tf-module-vpc.git"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT      = var.COMPONENT
  ENV            = var.ENV
  SUBNET_CIDR    = var.SUBNET_CIDR
  AZ             = var.AZ
}

module "mysql" {
  depends_on             = [module.vpc]
  source                 = "git::https://github.com/raghudevopsb64/tf-module-rds-mysql.git"
  ENGINE                 = var.ENGINE
  ENGINE_VERSION         = var.ENGINE_VERSION
  INSTANCE_CLASS         = var.INSTANCE_CLASS
  NAME                   = var.NAME
  SKIP_FINAL_SNAPSHOT    = var.SKIP_FINAL_SNAPSHOT
  ENV                    = var.ENV
  COMPONENT              = var.COMPONENT
  VPC_ID                 = module.vpc.VPC_ID
  VPC_CIDR               = module.vpc.VPC_CIDR
  SUBNET_IDS             = module.vpc.SUBNET_IDS
  PRIVATE_HOSTED_ZONE_ID = module.vpc.PRIVATE_HOSTED_ZONE_ID
  WORKSTATION_IP         = var.WORKSTATION_IP
}

module "app" {
  depends_on              = [module.vpc]
  source                  = "git::https://github.com/raghudevopsb64/tf-modfule-mutable.git"
  ONDEMAND_INSTANCE_COUNT = var.ONDEMAND_INSTANCE_COUNT
  SPOT_INSTANCE_COUNT     = var.SPOT_INSTANCE_COUNT
  VPC_ID                  = module.vpc.VPC_ID
  VPC_CIDR                = module.vpc.VPC_CIDR
  SUBNET_IDS              = module.vpc.SUBNET_IDS
  COMPONENT               = var.COMPONENT
  ENV                     = var.ENV
  NODE_TYPE               = var.EC2_NODE_TYPE
  PORT                    = var.PORT
  WORKSTATION_IP          = var.WORKSTATION_IP
  VPC_ACCESS_TO_ALB       = [module.vpc.VPC_CIDR]
  IAM_POLICY_CREATE       = true
  PRIVATE_HOSTED_ZONE_ID  = module.vpc.PRIVATE_HOSTED_ZONE_ID
}

