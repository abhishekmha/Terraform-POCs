resource "aws_internet_gateway" "demo-igw" {
    vpc_id = aws_vpc.demo-vpc.id
    tags = {
        Name = var.IGW
    }
}

resource "aws_route_table" "demo-public-rt" {
    vpc_id = aws_vpc.demo-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.demo-igw.id
    }
    
    tags = {
        Name = var.PUBLIC_RT
    }
}

resource "aws_route_table_association" "public-rt-subnet"{
    subnet_id = aws_subnet.demo-public-subnet.id
    route_table_id = aws_route_table.demo-public-rt.id
}

resource "aws_security_group" "demo-sg" {
    vpc_id = aws_vpc.demo-vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the NGIX
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.SG
    }
}
