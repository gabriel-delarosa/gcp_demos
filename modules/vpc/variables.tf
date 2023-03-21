variable "project_id" {
  type        = string
  default     = ""
  description = "ID for the project"
}

variable "network_name" {
  type        = string
  default     = ""
  description = "description"
}

# variable "private_subnet_name" {
#   type        = string
#   default     = ""
#   description = "description"
# }

# variable "public_subnet_name" {
#   type        = string
#   default     = ""
#   description = "description"
# }

variable subnet_region {
  type        = string
  default     = ""
  description = "Region to allocate subnets"
}
