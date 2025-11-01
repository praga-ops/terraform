terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.19.0"
        }
    }
}

module "iam" {
    source = "../modules/iam"
}
