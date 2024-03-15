module "s3" {
  source         = "./modules/s3"
  s3-bucket-name = var.s3-bucket-name
}

module "dynamodb" {
  source            = "./modules/dynamodb"
  aws_dynamodb_name = var.aws_dynamodb_name
  billing_mode      = var.billing_mode
  hash_key          = var.hash_key
  attribute_name    = var.attribute_name
  attribute_type    = var.attribute_type
}
 