variable "enable_iam" {
    type = bool
    default = true
}

variable "admin_user" {
    description = "This is to create the admin user"
    type = string
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
}