variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-0866a3c8686eaeeba"
}

variable "key_name" {
  description = "ssh public key"
  default     = "key-pair"
}
