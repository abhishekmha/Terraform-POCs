variable "AWS_REGION" {    
    default = "us-east-1"
}

variable "CIDR_BLOCK" {
    default = "10.0.0.0/16"
}

variable "VPC_NAME" {
    default = "demo-abhishek"
}

variable "AZ" {
	default = "us-east-1a"
}

variable "PUBLIC_SUBNET"{
	default = "demo-public-subnet"
}

variable "IGW"{
	default = "demo-igw"
}

variable "PUBLIC_RT"{
	default = "demo-public-rt"
}

variable "SG"{
	default = "demo-sg"
}

variable "AMI" {
    default = "ami-0747bdcabd34c712a"
}

variable "PRIVATE_KEY_PATH" {
  default = "demo-tf-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "demo-tf-key-pair.pub"
}

variable "INSTANCE_TYPE"{
	default = "t2.micro"
}

variable "EC2_USER" {
  default = "ubuntu"
}
