module "instance_template" {
    source = "github.com/terraform-google-modules/terraform-google-vm/modules/instance_template"
    #source = "terraform-google-modules/terraform-google-vm/modules/instance_template"
    region          = var.region
    project_id      = var.project_id
    subnetwork      = var.subnetwork
    service_account = var.service_account
    network         = var.network_name
    source_image    = var.source_image
    source_image_project = var.source_image_project
}