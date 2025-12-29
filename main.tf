# provider "aws" {
#     region = "ap-south-2"
  
# }
# resource "aws_instance" "my_ec2_instance" {
#     ami           = "ami-0018df03456b303db" # Example AMI ID for ap-south-2
#     instance_type = "t3.micro"
#     tags = {
#       Name = "MyTerraformEC2Instance"
# }

# }

##### Variables#################
# provider "aws" {
#     region = var.aws_region

  
# }
# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners=["amazon"]
#     filter {
#         name   = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }

# }
# resource "aws_instance" "my_ec2_instance" {
#     ami           = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type
#     tags = {
#       Name = var.instance_name
# }

# }

# ##Conditionals and Locals#################
# provider "aws" {
#     region = var.aws_region

  
# }
# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners=["amazon"]
#     filter {
#         name   = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }

# }
# locals {
#   name_tag=var.instance_type=="t3.micro" ? "Micro Instance":"Standard Instance"

# }
# resource "aws_instance" "my_ec2_instance" {
#     ami           = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type
#     tags = {
#       Name = local.name_tag
# }

# }

####Resource references and Depends-ON#################
# provider "aws" {
#     region = var.aws_region

  
# }
# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners=["amazon"]
#     filter {
#         name   = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }

# }
# resource "aws_s3_bucket" "my_bucket" {
#     bucket = var.bucket_name
#     tags = {
#       Name = "MyS3Bucket"
#     }
  
# }
# resource "aws_instance" "my_ec2_instance" {
#     ami           = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type
#     tags = {
#       Name = var.instance_name
# }
#     depends_on = [aws_s3_bucket.my_bucket]

# }

##### Modules #################
provider "aws" {
    region = "ap-south-2"

  
}
 data "aws_ami" "amazon_linux" {
    most_recent = true
    owners=["amazon"]
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
 }
module "ec2-instance" {
    source        = "./ec2-module"
    ami           = data.aws_ami.amazon_linux.id
    instance_type = "t3.micro"
    name          = "MyModuleEC2Instance"
  
}