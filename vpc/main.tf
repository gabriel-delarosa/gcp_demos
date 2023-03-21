module vpc {
    source = "../modules/vpc"
    network_name = var.network_name
    project_id = var.project_id
    subnet_region = var.region
}