output "main_cidr" {
    value = aws_vpc.main.cidr_block
}

output "main_cidr_id" {
    value = aws_vpc.main.id
}