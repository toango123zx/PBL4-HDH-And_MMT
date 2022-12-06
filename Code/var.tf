variable "region" {
  default = "ap-southeast-1"
}

variable "AmiLinux" {
#   type = "map"
  default = {
    ap-southeast-1 = "ami-094bbd9e922dc515d"
  }
}
variable "Full_CIDR" {
    default = "172.16.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet_Public" {
  default = "172.168.1.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet_Private" {
  default = "172.168.2.0/24"
  description = "the cidr of the subnet"
}
variable "key_name" {
  default = "pbl4"
  description = "the ssh key to use in the EC2 machines"
}
