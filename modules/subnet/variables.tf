variable "kube_subnet" {
    description = "This is the subnet for Kubernetes"
    type = string
}

variable "kube_vpc" {
    description = "This is the vpc for kubernetes"
    type = string
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
}