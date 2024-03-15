variable "s3-bucket-name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "aws_dynamodb_name" {
  description = "dynamo db Name"
  type        = list(string)
}

variable "billing_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "hash_key" {
  type    = string
  default = "LockID"
}

variable "attribute_name" {
  type    = string
  default = "LockID"
}

variable "attribute_type" {
  type    = string
  default = "S"
}
