# output "instance_public_ip" {
#   value = aws_instance.my_ec2_instance.public_ip

# }
####Conditionals and Locals#################
output "instance_name_tag" {
  value = local.name_tag

}