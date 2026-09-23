output "user_ids" {
  description = "Map of user key to user ID."
  value       = { for k, u in stackit_secretsmanager_user.this : k => u.user_id }
}

output "usernames" {
  description = "Map of user key to auto-generated username."
  value       = { for k, u in stackit_secretsmanager_user.this : k => u.username }
}

output "passwords" {
  description = "Map of user key to auto-generated password. Sensitive."
  value       = { for k, u in stackit_secretsmanager_user.this : k => u.password }
  sensitive   = true
}
