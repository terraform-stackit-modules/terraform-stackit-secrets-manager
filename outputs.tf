output "instance_id" {
  description = "The ID of the Secrets Manager instance (created, or the provided instance_id when create_instance is false)."
  value       = coalesce(module.instance.instance_id, var.instance_id)
}

output "user_ids" {
  description = "Map of user key to user ID."
  value       = module.user.user_ids
}

output "usernames" {
  description = "Map of user key to auto-generated username."
  value       = module.user.usernames
}

output "user_passwords" {
  description = "Map of user key to auto-generated password. Sensitive."
  value       = module.user.passwords
  sensitive   = true
}
