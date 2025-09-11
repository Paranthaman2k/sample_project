variable "ami" {
  type        = string
  default     = ""
  description = "ami"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "instance type"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Key Name"
}

variable environment {
  type        = string
  default     = ""
  description = "environment"
}

