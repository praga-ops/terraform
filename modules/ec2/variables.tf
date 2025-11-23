variable "kube_ami" {
    type = string
    description = "This is the kubernetes base ami"
}

variable "kube_ec2_type" {
    type = string
    description = "This is the Kubernetes ec2 instance type"
}

variable "kube_ec2_subnet" {
    type = string
    description = "This is the Kubernetes cluster subnet"
}

variable "kube_key_name" {
    type = string
    description = "This is the base kubernetes key to access EC2"
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
}