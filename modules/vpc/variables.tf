variable "enable_vpc" {
    type = bool
    default = true
}

variable "main_cidr" {
    description = "This is the main CIDR block"
    type = string
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
}