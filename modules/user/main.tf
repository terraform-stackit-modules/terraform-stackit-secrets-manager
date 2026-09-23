resource "stackit_secretsmanager_user" "this" {
  for_each = var.users

  project_id          = var.project_id
  instance_id         = var.instance_id
  description         = each.value.description
  write_enabled       = each.value.write_enabled
  rotate_when_changed = each.value.rotate_when_changed
}
