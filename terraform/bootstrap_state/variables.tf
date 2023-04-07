variable "dynamodb_table_name" {
  description = "Name of the DynamoDB Table for locking Terraform state."
  default     = "terraform-state-lock"
  type        = string
}

variable "dynamodb_table_tags" {
  description = "Tags of the DynamoDB Table for locking Terraform state."
  default = {
    Name       = "terraform-state-lock"
    Automation = "Terraform"
  }
  type = map(string)
}

variable "region" {
  description = "AWS region."
  type        = string
}

variable "account_alias" {
  description = "The desired AWS account alias."
  type        = string
}

variable "bucket_purpose" {
  description = "Name to identify the bucket's purpose"
  default     = "tf-state"
  type        = string
}

variable "state_bucket_tags" {
  type        = map(string)
  default     = { Automation : "Terraform" }
  description = "Tags to associate with the bucket storing the Terraform state files"
}

variable "enable_s3_public_access_block" {
  description = "Bool for toggling whether the s3 public access block resource should be enabled."
  type        = bool
  default     = true
}

variable "dynamodb_point_in_time_recovery" {
  type        = bool
  default     = false
  description = "Point-in-time recovery options"
}

variable "kms_master_key_id" {
  type        = string
  default     = ""
  description = "The AWS KMS master key ID used for the SSE-KMS encryption of the state bucket."
}

variable "bucket_key_enabled" {
  type        = bool
  default     = false
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
}