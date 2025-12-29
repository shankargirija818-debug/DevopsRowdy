variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "ap-south-2"
  
}
variable "instance_type" {
    description = "The type of EC2 instance to create"
    type        = string
    default     = "t3.micro"
  
}
variable "instance_name" {
    description = "The name tag for the EC2 instance"
    type        = string
    default     = "MyTerraformEC2Instance"
  
}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
    default     = "my-unique-terraform-bucket-17089019"
  
}