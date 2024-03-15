resource "aws_s3_bucket" "my-s3" {
  bucket = var.s3-bucket-name
}
#resource "aws_s3_bucket_versioning" "example" {
#  bucket = aws_s3_bucket.my-s3.id

 # versioning_configuration {
 #   status = "Enabled"
 # }
#}
