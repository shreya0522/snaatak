#S3 Bucket for storing the respective terrafomr state file
output "aws_s3_bucket_arn" {
  value = module.s3.aws_s3_bucket_arn
}

#Dynamo DB Table Creation
output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name[*].name
}