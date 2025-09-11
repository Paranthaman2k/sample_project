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

variable "environment" {
    description = "environment"
    type = string
}