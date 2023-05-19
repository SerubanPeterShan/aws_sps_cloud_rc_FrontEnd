resource "aws_s3_bucket" "S3bucket" {
    bucket = "aws-rc-cloud"
    tags = {
        Name = "sps rccloud aws"
    }
}
resource "aws_s3_account_public_access_block" "S3bucketpublic" {
   bucket= aws_s3_bucket.S3bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "s3StaticWeb" {
  bucket= aws_s3_bucket.S3bucket.id

  index_document {
    suffix = "index.html"
  }
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  # ...

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${self.id} --paths '/*'"
  }
}
