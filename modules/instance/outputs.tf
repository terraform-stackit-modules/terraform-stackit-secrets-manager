output "instance_id" {
  description = "The ID of the Secrets Manager instance (null when create_instance is false)."
  value       = var.create_instance ? stackit_secretsmanager_instance.this[0].instance_id : null
}
