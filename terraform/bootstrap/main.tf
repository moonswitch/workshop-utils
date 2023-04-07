module "bootstrap" {
  source  = "trussworks/bootstrap/aws"
  version = "~> 4.0.0"

  region               = var.region
  dynamodb_table_name  = var.dynamodb_table_name
  account_alias        = var.account_alias
  manage_account_alias = false
  kms_master_key_id = ""
}