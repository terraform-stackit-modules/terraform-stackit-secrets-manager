#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it creates a
# Secrets Manager instance and a read-only + a read-write user.
#####################################################################################

module "secrets_manager" {
  source = "../.."

  project_id = var.project_id
  name       = "example-secrets-manager"
  acls       = ["0.0.0.0/0"]

  users = {
    reader = {
      description   = "Example read-only user"
      write_enabled = false
    }
    writer = {
      description   = "Example read-write user"
      write_enabled = true
    }
  }
}
