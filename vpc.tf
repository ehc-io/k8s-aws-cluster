module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "${var.prefix}-vpc"
  cidr = "10.0.0.0/16"
  enable_nat_gateway = true
  enable_dns_hostnames = true

  azs            = ["${var.region}a"]
  public_subnets = ["10.0.10.0/24"]

  tags = {
    Terraform = "true"
    Environment = "lab"
  }
}

resource "aws_security_group" "public" {
  name   = "${var.prefix}-sg-public"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.AWS_ALLOW_LIST]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "k8s.lab"
  }
}

resource "aws_security_group" "private" {
  name   = "${var.prefix}-sg-private"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.10.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "k8s.lab"
  }
}

###