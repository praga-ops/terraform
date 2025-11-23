resource "aws_key_pair" "main" {

  key_name   = var.key_pair_name
  public_key = var.pub_key

}