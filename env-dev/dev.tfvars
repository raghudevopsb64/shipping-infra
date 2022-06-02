VPC_CIDR_BLOCK      = "10.10.4.0/24"
ENV                 = "dev"
SUBNET_CIDR         = ["10.10.4.0/25", "10.10.4.128/25"]
ENGINE              = "mysql"
ENGINE_VERSION      = "5.7"
INSTANCE_CLASS      = "db.t3.micro"
NAME                = "dummy"
SKIP_FINAL_SNAPSHOT = true
