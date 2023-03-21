output "self_link" {
  description = "Self-link of instance template"
  #value       = module.instance_template.tpl.self_link

  value =module.instance_template.self_link
}

output "name" {
  description = "Name of instance template"
  value       = module.instance_template.name
}

output "tags" {
  description = "Tags that will be associated with instance(s)"
  value       = module.instance_template.tags
}