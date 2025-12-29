resource "aws_instance" "my-ec2" {  # Use underscore here
    ami           = var.ami
    instance_type = var.instance_type
    
    tags = {
        Name = var.name
    }
}