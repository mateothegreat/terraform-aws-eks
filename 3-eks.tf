resource "aws_eks_cluster" "cluster" {

    depends_on = [

        aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy

    ]

    name     = var.cluster_name
    role_arn = aws_iam_role.cluster.arn
    version  = var.cluster_version

    vpc_config {

        subnet_ids              = var.private_subnets
        endpoint_public_access  = true
        endpoint_private_access = false

    }

}

resource "aws_eks_node_group" "default" {

    depends_on = [

        aws_iam_role_policy_attachment.workers_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.workers_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.workers_AmazonEC2ContainerRegistryReadOnly

    ]

    cluster_name    = var.cluster_name
    node_group_name = "default"
    node_role_arn   = aws_iam_role.workers.arn
    subnet_ids      = var.private_subnets

    scaling_config {

        desired_size = 1
        max_size     = 1
        min_size     = 1

    }

    update_config {

        max_unavailable = 1

    }

    remote_access {

        ec2_ssh_key = var.keypair_name

    }

    lifecycle {

        ignore_changes = [ scaling_config[ 0 ].desired_size ]

    }

}
