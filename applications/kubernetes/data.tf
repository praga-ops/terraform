data "aws_internet_gateway" "default" {
    filter {
        name = "owner-id"
        values = ["152569708196"]
    }
}