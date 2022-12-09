variable "region" {
  default = "ap-southeast-1"
}

variable "AmiLinux" {
#   type = "map"
  default = {
    ap-southeast-1 = "ami-094bbd9e922dc515d"
  }
}
variable "Subnet_Public_1" {
  default = "10.0.1.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet_Public_2" {
  default = "10.0.2.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet_Private_1" {
  default = "10.0.3.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet_Private_2" {
  default = "10.0.4.0/24"
  description = "the cidr of the subnet"
}
variable "key_name" {
  default = "pbl4"
  description = "the ssh key to use in the EC2 machines"
}

variable "Availability_zone_1" {
  default = "ap-southeast-1a"
}
variable "Availability_zone_2" {
    default = "ap-southeast-1b"
  
}