resource "aws_instance" "main" {
  ami           = var.kube_ami
  instance_type = var.kube_ec2_type
  subnet_id     = var.kube_ec2_subnet
  key_name = var.kube_key_name

  tags = {
    project = var.project_tag
  }
}