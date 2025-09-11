resource "aws_instance" "pro_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.pub_subnet1.id
    associate_public_ip_address = true
    key_name = var.key_name


    user_data = << -EOF 
                #!/bin/bash
                echo "Hello Paran" > /home/ec2-user/hello.txt
                EOF


    tags = {
        name = "${var.environment}-ec2"
    }
}