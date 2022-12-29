provider "aws" {
  # access_key = "AKIA2CPQDXMVKH3OKWFE"
  # secret_key = "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"
  access_key = "AKIA4VGK4FWXYIVQ5LAQ"
  secret_key = "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"
  region     = "ap-southeast-1"
}
resource "aws_vpc" "MyVpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = "MyVpc"
    }
}