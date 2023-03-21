project_id = <project_id>

zone = "us-central1-a"

region = "us-central1"

num_instances = "1"

network_tier = "STANDARD"

network_name = "demo-network"

source_image = "ubuntu-minimal-1804-bionic-v20230308"

source_image_project = "ubuntu-os-cloud"

vm_names = ["seed", "vm-node1", "vm-node2"]

vm_nodes_count = 2

update_policy = [ {
    instance_redistribution_type = "NONE"
    max_surge_fixed = 0
    max_unavailable_fixed = 4
    min_ready_sec = 50
    minimal_action = "REPLACE"
    replacement_method = "RECREATE"
    type = "PROACTIVE"
}]