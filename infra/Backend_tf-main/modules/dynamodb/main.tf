resource "aws_dynamodb_table" "my_dynamo_table" {
  count        = length(var.aws_dynamodb_name)
  name         = var.aws_dynamodb_name[count.index]
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.attribute_name
    type = var.attribute_type
  }
}