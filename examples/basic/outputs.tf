output "instance_id" {
  description = "The ID of the Secrets Manager instance created by the example."
  value       = module.secrets_manager.instance_id
}

output "user_ids" {
  description = "The user IDs created by the example."
  value       = module.secrets_manager.user_ids
}
