variable "AWS_ALLOW_LIST" {
  type        = string
  default     = "179.99.126.60/32"
}

variable "prefix" {
  type = string
  default     = "k8s-lab"
}

variable "region" {
  type = string
  default     = "us-east-1"
}
