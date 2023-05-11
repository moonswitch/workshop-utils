variable "github_owner" {
  type        = string
  description = "Github user or org. Used to configure github provider."
}

variable "github_token" {
  type        = string
  description = "Github personal access token. Used to configure github provider."
}

variable "region" {
  type        = string
  description = "AWS region. Used to configure AWS provider"
}

variable "repo_name" {
  type        = string
  description = "Name of the repository to create."
}

variable "ssh_private_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "Path to the user's private key file"
}