#
# @author GDev
# @date November 2021
#

# This might be overridden
variable "cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "cluster-autoscaler-version" {
  default = "v1.20.0"
}

variable "cluster-ingress-port" {
  default = "30443"
  type    = string
}

variable "eks-instance-type" {
  default = "t2.large"
  type    = string
}

# This might be overridden
variable "eks-instance-count" {
  default = 3
}

variable "eks-version" {
  default = "1.20"
  type    = string
}

variable "eks-ami" {
  default = "ami-031de2a4db6a7880f"
  type    = string
}

variable "ingress-version" {
  default = "0.11.3"
}

variable "left-availability-zone" {
  default = "eu-west-1b"
  type    = string
}

variable "left-subnet-cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "prometheus-version" {
  default = "19.2.3"
}

variable "region" {
  default = "eu-west-1"
  type    = string
}

variable "registry_username" {
}

variable "registry_password" {
}

variable "right-availability-zone" {
  default = "eu-west-1a"
  type    = string
}

variable "right-subnet-cidr" {
  default = "10.0.1.0/24"
  type    = string
}
