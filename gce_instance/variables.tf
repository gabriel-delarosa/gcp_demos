variable project_id {
  type        = string
  default     = ""
  description = "ID of the project to work on"
}

variable region {
  type        = string
  default     = ""
  description = "Region wher instace will be created"
}

variable zone {
  type        = string
  default     = ""
  description = "Availability Zone for the instance"
}

variable instance_name {
  type        = string
  default     = ""
  description = "Name for the VM Instance"
}

variable machine_type {
  type        = string
  default     = ""
  description = "Type of instance to crate eg. f1-micro, e2-micro,etc"
}
