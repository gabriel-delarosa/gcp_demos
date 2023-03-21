data "google_compute_network" "network" {
  name = var.network_name
}

locals {
  vm_names = toset(var.vm_names)
  network_data = data.google_compute_network.network
}

resource "google_compute_region_disk" "default" {
    for_each = local.vm_names
    name = "mig-demo-${each.value}"
    type = "pd-ssd"
    size = 10
    project = var.project_id
    region = var.region
    #image = var.source_image
    physical_block_size_bytes = 4096

    replica_zones = ["us-central1-a", "us-central1-b"]
}

module "instance_template" {
    source = "../modules/instance_template"
    region          = var.region
    project_id      = var.project_id
    #subnetwork      = var.subnetwork
    subnetwork      = "subnet-01"
    service_account = var.service_account
    network_name    = local.network_data.self_link
    source_image = var.source_image
    source_image_project = var.source_image_project

}

module region_mig {
    source = "../modules/region_mig"
    instance_template = module.instance_template.self_link
    region = var.region
    target_size = 0
    update_policy = var.update_policy

    depends_on = [
        google_compute_region_disk.default
    ]

}

module per_instance_config {
    for_each = google_compute_region_disk.default
    source = "../modules/instance_configs"
    region = var.region
    region_instance_group_manager = module.region_mig.instance_group_manager.name
    project_id = var.project_id
    instance_config_name = "demo-mig-${each.value.name}"
    instance_template = module.instance_template.self_link
    disk_device_name = "stateful-disk-${each.value.name}"
    disk_source_id = google_compute_region_disk.default[each.key].id
}
