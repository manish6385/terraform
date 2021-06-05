variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "users" {
  type = list
  description = "List of 3 usernames to be created"
  default = ["user-1","user-2","user-3"]
}