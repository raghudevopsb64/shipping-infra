VPC_CIDR_BLOCK      = "10.20.4.0/24"
ENV                 = "prod"
SUBNET_CIDR         = ["10.20.4.0/25", "10.20.4.128/25"]
ENGINE              = "mysql"
ENGINE_VERSION      = "5.7"
INSTANCE_CLASS      = "db.t3.micro"
NAME                = "dummy"
SKIP_FINAL_SNAPSHOT = true

EC2_NODE_TYPE           = "t3.small"
PORT                    = 8080
ONDEMAND_INSTANCE_COUNT = 0
SPOT_INSTANCE_COUNT     = 2
