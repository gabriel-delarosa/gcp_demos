module "compute_instance" {
    source = "github.com/terraform-google-modules/terraform-google-vm/modules/compute_instance"
    #source = "terraform-google-modules/terraform-google-vm/modules/compute_instance"
    instance_template = var.instance_template
    region              = var.region
    zone                = var.zone
    subnetwork          = var.subnetwork
    num_instances       = var.num_instances
    hostname            = var.hostname
    deletion_protection = var.deletion_protection

    access_config = var.access_config
}