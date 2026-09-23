resource "stackit_secretsmanager_instance" "this" {
  count = var.create_instance ? 1 : 0

  project_id = var.project_id
  name       = var.name
  acls       = var.acls

  kms_key = var.kms_key
}
