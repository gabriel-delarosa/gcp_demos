
module "compute_instance" {
    source = "../modules/compute"
    region              = var.region
    zone                = var.zone
    subnetwork          = var.subnetwork
    num_instances       = var.num_instances
    hostname            = "instance-simple"
    instance_template   = module.instance_template.self_link
    deletion_protection = false
    project_id = var.project_id
    access_config = [{
        nat_ip       = var.nat_ip
        network_tier = var.network_tier
    }, ]

    depends_on = [module.vpc]
}

module "instance_template" {
    source = "../modules/instance_template"
    region          = var.region
    project_id      = var.project_id
    subnetwork      = var.subnetwork
    service_account = var.service_account
#  param  = va.lue
}

module vpc {
    source = "../modules/vpc"
    network_name = var.network_name
    project_id = var.project_id
}