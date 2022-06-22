output "vpc_name" {
  value = module.vpc.name
}

output "vpc_if" {
  value = module.vpc.vpc_id
}

output "master_node_id" {
  value = aws_instance.master.id
}

output "master_node_eip" {
  value = aws_eip.master_eip.public_ip
}

output "master_node_dns" {
  value = aws_eip.master_eip.public_dns
}

output "worker1_node_id" {
  value = aws_instance.worker1.id
}

output "worker1_node_eip" {
  value = aws_eip.worker_eip1.public_ip
}

output "worker1_node_dns" {
  value = aws_eip.worker_eip1.public_dns
}

output "worker2_node_id" {
  value = aws_instance.worker2.id
}

output "worker2_node_eip" {
  value = aws_eip.worker_eip2.public_ip
}

output "worker2_node_dns" {
  value = aws_eip.worker_eip2.public_dns
}