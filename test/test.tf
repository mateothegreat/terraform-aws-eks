provider "aws" {

    profile = "nvrai"
    region  = "us-east-1"

}

module "test" {

    source = "../"

    cluster_name    = "nvrai-dev-2"
    vpc_cidr        = "10.20.0.0/16"
    cluster_version = "1.22"
    private_subnets = [ "" ]

}
