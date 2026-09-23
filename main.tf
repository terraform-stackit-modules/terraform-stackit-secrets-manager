module "instance" {
  source = "./modules/instance"

  create_instance = var.create_instance
  project_id      = var.project_id
  name            = var.name
  acls            = var.acls
  kms_key         = var.kms_key
}

module "user" {
  source = "./modules/user"

  project_id  = var.project_id
  instance_id = coalesce(module.instance.instance_id, var.instance_id)
  users       = var.users
}
