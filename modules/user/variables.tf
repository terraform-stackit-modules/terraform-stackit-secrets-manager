variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "instance_id" {
  description = "ID of the Secrets Manager instance the users belong to."
  type        = string
}

variable "users" {
  description = <<-EOT
    Map of users to create, keyed by a stable identifier. Each value:
      - `description`         : a description differentiating users (immutable after creation).
      - `write_enabled`       : whether the user has write access to the secrets engine.
      - `rotate_when_changed` : optional map whose change forces recreation (rotation).
    Auto-generated username/password are exposed via outputs (password sensitive).
  EOT
  type = map(object({
    description         = string
    write_enabled       = bool
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}
