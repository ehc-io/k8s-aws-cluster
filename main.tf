provider "aws" {
  region = var.region
}

variable "AWS_ACCESS_KEY_ID" {
    type = string
}

variable "AWS_SECRET_KEY_ID" {
    type = string
}