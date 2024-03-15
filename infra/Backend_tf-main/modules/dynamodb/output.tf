#DynamoDB table creation
output "dynamodb_table_name" {
  value = aws_dynamodb_table.my_dynamo_table
}