terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.15.0"
        }
    }
}

provider "aws" {
    #configuration options
    # you can give access key and secret key here, but security problem.
    region = "ap-south-1"
}