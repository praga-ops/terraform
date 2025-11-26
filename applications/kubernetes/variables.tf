variable "enable_ec2" {
    type = bool
    default = true
}

variable "enable_iam" {
    type = bool
    default = true
}

variable "enable_keypair" {
    type = bool
    default = true
}

variable "enable_subnet" {
    type = bool
    default = true
}

variable "enable_vpc" {
    type = bool
    default = true
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
    default = null
}

variable "iam_user" {
    description = "This is to create the admin user"
    type = map (object ({
        name = string
        project = string
    }))
}

variable "vpcs" {
    description = "This is the main CIDR block"
    type = map (object ({
        cidr_block = string
        project = string
    }))
}

variable "subs" {
    description = "This is the main subnet"
    type = map (object ({
        cidr_block = string
        project = string
    }))
}

variable "keys" {
    description = "This is to create new key pairs"
    type = map (object({
        key_name = string
        public_key = string
    }))
}

variable "instances" {
    type = map (object ({
        ami = string
        instance_type = string
        project = string
    }))
}