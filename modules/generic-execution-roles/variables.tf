variable "role_prefix" {
  type        = string
  description = "Role Prefix"
  default     = "generic"
}

variable "tags" {
  type        = map(string)
  description = "Tags to attach to the roles"
  default     = {}
}
