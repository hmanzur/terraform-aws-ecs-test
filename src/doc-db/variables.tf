variable region {}

variable vpc_id {
  default     = null
  description = "Subnet vpc id"
}

variable cidr_block {
  description = "Subnet vpc cidr block"
}

variable deletion_protection {
  default     = false
  description = "Delete protection default is false"
}

variable skip_final_snapshot {
  default     = true
  description = "Skip final snapshot default is true"
}

variable cluster_identifier {
  default     = ""
  description = "(Optional, Forces new resource) The indentifier for the DocDB instance, if omitted, Terraform will assign a random, unique identifier."
}

variable instance_class {
  default = "db.t3.medium"
}

variable cluster_instances_count {
  default = 1
}

variable master_username {}

variable master_password {} 