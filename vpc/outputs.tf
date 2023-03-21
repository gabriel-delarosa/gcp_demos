output network_name {
  value       = module.vpc.network_name
}

output network_self_link {
    value = module.vpc.network_self_link
}

output subnets_names {
    value = module.vpc.subnets_names
}

output subnets_regions {
    value = module.vpc.subnets_regions
}