variable "enable_keypair" {
    type = bool
    default = true
}

variable "key_pair_name" {
    type = string
    description = "This is to create ssh keys assign to EC2 machines for remote access"
}

variable "pub_key" {
    type = string
    description = "This is to assign the public_key"
}