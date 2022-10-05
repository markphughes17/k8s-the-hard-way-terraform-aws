variable "common_tags" {
    type = map
    description = "tags to be applied to all resources"
}

variable "vpc_cidr" {
    type = string
    description = "CIDR for the VPC"
}

variable "public_subnet_cidr" {
    type = string
    description = "CIDR for the public subnet"
}

variable "web_cidr" {
    type = string
    description = "CIDR for allowing web traffic"
    default = "0.0.0.0/0"
}

variable "ssh_public_key" {
    type = string
    description = "ssh key used for SSH access to k8s nodes"
}

variable "instance_count" {
    type = number
    description = "The number of this group of instances to create"
}

variable "instance_type" {
    type = string
    description = "The instance family and size to use"
}