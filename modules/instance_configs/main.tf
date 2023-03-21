resource "google_compute_region_per_instance_config" "with_disk" {
  #zone = var.instance_group_manager_zone
  region = var.region
  project = var.project_id
  region_instance_group_manager = var.region_instance_group_manager
  name = var.instance_config_name
  preserved_state {
    metadata = {
      foo = "bar"
      // Adding a reference to the instance template used causes the stateful instance to update
      // if the instance template changes. Otherwise there is no explicit dependency and template
      // changes may not occur on the stateful instance
      #instance_template = google_compute_instance_template.igm-basic.self_link
      instance_template = var.instance_template
    }

    disk {
      device_name = var.disk_device_name
      #source      = google_compute_disk.default.id
      source = var.disk_source_id
      mode        = "READ_WRITE"
      #delete_rule = "NEVER"
    }
  }
}
