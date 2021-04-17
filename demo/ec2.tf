resource "aws_instance" "demo-ec2" {
    ami = var.AMI
    instance_type = var.INSTANCE_TYPE
    # VPC
    subnet_id = aws_subnet.demo-public-subnet.id
    # Security Group
    vpc_security_group_ids = [aws_security_group.demo-sg.id]
    # the Public SSH key
    key_name = aws_key_pair.demo-tf-key-pair.id
    associate_public_ip_address = true
    # nginx installation
    provisioner "file" {
        source = "machineinfo.sh"
        destination = "/tmp/machineinfo.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/machineinfo.sh",
             "sudo /tmp/machineinfo.sh"
        ]
    }
    connection {
	host = self.public_ip
        user = var.EC2_USER
        private_key = file(var.PRIVATE_KEY_PATH)
    }
    tags = {
        Name = "demo-ec2"
    }
}
// Sends your public key to the instance
resource "aws_key_pair" "demo-tf-key-pair" {
    key_name = "demo-tf-key-pair"
    public_key = file(var.PUBLIC_KEY_PATH)
}
