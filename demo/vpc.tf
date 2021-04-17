resource "aws_vpc" "demo-vpc" {
    cidr_block = var.CIDR_BLOCK
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"    

    tags = {
        Name = var.VPC_NAME
    }
}

resource "aws_subnet" "demo-public-subnet" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.AZ
    tags = {
        Name = var.PUBLIC_SUBNET
    }
}
