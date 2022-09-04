variable "cluster_name" {

    type        = string
    description = "cluster name"

}

variable "cluster_version" {

    type        = string
    description = "EKS version to run"

}

variable "vpc_cidr" {

    type        = string
    description = "cidr block for the vpc"

}

variable "private_subnets" {

    type        = list(string)
    description = "private subnets"

}

variable "tags" {

    type        = map(string)
    description = "tags to apply to all resources"
    default     = {}

}

variable "additional_security_groups" {

    type        = list(string)
    description = "additional security group id's to attach to the cluster"
    default     = [ ]

}

variable "map_users" {

    description = "Additional IAM users to add to the aws-auth configmap."

    type = list(object({
        userarn  = string
        username = string
        groups   = list(string)
    }))

    default = [ ]

}

variable "cluster_enabled_log_types" {

    description = "log types to enable"
    type        = list(string)
    default     = [ "api", "audit", "authenticator", "controllerManager", "scheduler" ]

}

variable "keypair_name" {

    type        = string
    default     = null
    description = "ssh key pair name"

}
