module "gateway" {
  source = "./modules/gateway"

  region       = var.region
  cluster_name = var.cluster_name

  load_balancer_name = "a2466d792c45e44b9b68f91adbd741a4"
}
