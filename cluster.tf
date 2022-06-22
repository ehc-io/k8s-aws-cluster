resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  user_data     = file("master_install.sh")
  subnet_id = module.vpc.public_subnets[0]
  key_name = "k8s-keypair"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.private.id, aws_security_group.public.id]
  private_ip = "10.0.10.101"
  tags = {
    Name = "k8s.lab.master"
  }
}

resource "aws_instance" "worker1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data     = file("worker_install.sh")
  subnet_id = module.vpc.public_subnets[0]
  key_name = "k8s-keypair"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.private.id, aws_security_group.public.id]
  private_ip = "10.0.10.102"
  tags = {
    Name = "k8s.lab.worker.1"
  }
}


resource "aws_instance" "worker2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data     = file("worker_install.sh")
  subnet_id = module.vpc.public_subnets[0]
  key_name = "k8s-keypair"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.private.id, aws_security_group.public.id]
  private_ip = "10.0.10.103"
  tags = {
    Name = "k8s.lab.worker.2"
  }
}

resource "aws_eip" "master_eip" {
  instance = aws_instance.master.id
  associate_with_private_ip = "10.0.10.101"
  vpc      = true
  depends_on = [aws_instance.master, aws_security_group.private, aws_security_group.public]
  tags = {
    Name = "k8s.lab.master"
  }
}

resource "aws_eip" "worker_eip1" {
  instance = aws_instance.worker1.id
  associate_with_private_ip = "10.0.10.102"
  vpc      = true
  depends_on = [aws_instance.worker1, aws_security_group.private, aws_security_group.public]
  tags = {
    Name = "k8s.lab.worker.1"
  }
}

resource "aws_eip" "worker_eip2" {
  instance = aws_instance.worker2.id
  associate_with_private_ip = "10.0.10.103"
  vpc      = true
  depends_on = [aws_instance.worker2, aws_security_group.private, aws_security_group.public]
  tags = {
    Name = "k8s.lab.worker.2"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
