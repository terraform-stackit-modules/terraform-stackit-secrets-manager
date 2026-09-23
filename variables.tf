# ─── Core ─────────────────────────────────────────────────────────────────────

variable "project_id" {
  description = "STACKIT project ID to which the Secrets Manager instance and its users are associated."
  type        = string
}

# ─── Instance ─────────────────────────────────────────────────────────────────

variable "create_instance" {
  description = "Whether to create the Secrets Manager instance. Set to false to manage users against an existing instance provided via `instance_id`."
  type        = bool
  default     = true
}

variable "instance_id" {
  description = "ID of an existing Secrets Manager instance. Used for users when `create_instance` is false."
  type        = string
  default     = null
}

variable "name" {
  description = "Instance name."
  type        = string
  default     = null
}

variable "acls" {
  description = "Access control list: set of IPs or CIDR ranges permitted to access the instance."
  type        = set(string)
  default     = []
}

variable "kms_key" {
  description = <<-EOT
    Optional STACKIT-KMS key for secret encryption/decryption:
      `{ key_id, key_ring_id, key_version, service_account_email }`.
  EOT
  type = object({
    key_id                = string
    key_ring_id           = string
    key_version           = number
    service_account_email = string
  })
  default = null
}

# ─── Users ────────────────────────────────────────────────────────────────────

variable "users" {
  description = <<-EOT
    Map of users to create, keyed by a stable identifier. Each value:
      - `description`         : a description differentiating users (immutable after creation).
      - `write_enabled`       : whether the user has write access to the secrets engine.
      - `rotate_when_changed` : optional map whose change forces rotation.
    Auto-generated passwords are exposed via the `user_passwords` output (sensitive).
  EOT
  type = map(object({
    description         = string
    write_enabled       = bool
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}
