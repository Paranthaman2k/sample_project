variable "bucket_name" {
    description = "name of the bucket"
    type = string
}

variable "environment" {
    description = "environment"
    type = string
}
variable "ami" {
  type        = string
  description = "ami"
}

variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "key_name" {
  type        = string
  description = "Key Name"
}

variable "region" {
  type        = string
  description = "Key Name"
}

variable "vpc_cidr" {
    description = "VPC CIDR"
    type = string
}

variable "pub_cidr" {
    description = "Public Subnet CIDR"
    type = list(string)
}

variable "pri_cidr" {
    description = "Private Subnet CIDR"
    type = list(string)
}

variable "az" {
    description = "Availability Zone"
    type = list(string)

}
