variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "create_instance" {
  description = "Whether to create the Secrets Manager instance."
  type        = bool
  default     = true
}

variable "name" {
  description = "Instance name."
  type        = string
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
