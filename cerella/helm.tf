#
# @author GDev
# @date August 2021
#

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.environment.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.environment.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.environment_auth.token
  }
}

resource "random_password" "model_override_token" {
  length  = 56
  special = true
}

resource "random_password" "aaa_database_password" {
  length  = 56
  special = true
}

resource "helm_release" "green_zone" {
  name       = "green"
  repository = "http://helm.cerella.ai"
  chart      = "cerella_green"
  version    = var.cerella_version

  set {
    name  = "dockerConfigJson"
    value = var.docker_config
  }

  set {
    name  = "storage_server.MODEL_DOWNLOAD_TOKEN"
    value = random_password.model_override_token.result
  }

  set {
    # TODO: change with v1
    name  = "aaa.POSTGRES_PASSWORD"
    value = random_password.aaa_database_password.result
  }
}