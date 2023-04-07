#
# Terraform state bucket
#

locals {
  state_bucket   = "${var.account_alias}-${var.bucket_purpose}-${var.region}"
}

module "terraform_state_bucket" {
  source  = "trussworks/s3-private-bucket/aws"
  version = "~> 4.3.0"

  bucket         = local.state_bucket

  use_account_alias_prefix = false
  bucket_key_enabled       = var.bucket_key_enabled
  kms_master_key_id        = var.kms_master_key_id
  sse_algorithm            = var.kms_master_key_id != null ? "aws:kms" : null

  enable_s3_public_access_block = var.enable_s3_public_access_block
  tags                          = var.state_bucket_tags
}

#
# Terraform state locking
#

# Ignore warnings about point-in-time recovery since this table holds no data
# The terraform state lock is meant to be ephemeral and does not need recovery
#tfsec:ignore:AWS086
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.dynamodb_table_name
  hash_key       = "LockID"
  read_capacity  = 2
  write_capacity = 2

  server_side_encryption {
    enabled = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.dynamodb_point_in_time_recovery
  }

  tags = var.dynamodb_table_tags
}