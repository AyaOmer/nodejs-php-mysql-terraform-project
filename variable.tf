variable "region" {
  type    = string 
  default = "us-east-1"
}

variable "ami" {
  type    = string 
  default = "ami-0c94755bb95c71c99"
}

variable "public_key" {
  description = "ssh public key"
  default = "ayakey"
}