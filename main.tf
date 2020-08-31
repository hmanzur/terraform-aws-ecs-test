module "vpc" {
  source = "./src/vpc"

  region = var.region

  name = var.app_name
}

module "database" {
  source = "./src/doc-db"

  region = var.region

  cluster_identifier = "terraform-doc-db"

  vpc_id = module.vpc.id

  cidr_block = module.vpc.cidr_block

  master_username = var.db_username

  master_password = var.db_password
}

module "ecr" {
  source = "./src/ecr"

  image_name = var.app_name
}

module "ecs" {
  source = "./src/ecs"

  name = var.app_name

  vpc_id = module.vpc.id

  cidr_block = module.vpc.cidr_block

  repository_url = module.ecr.repository
}

module "gateway" {
  source = "./src/api-gateway"

  name = var.app_name
}