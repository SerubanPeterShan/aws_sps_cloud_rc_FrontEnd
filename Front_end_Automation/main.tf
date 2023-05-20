resource "aws_s3_bucket" "S3bucket" {
    bucket = "aws-rc-cloud"
    tags = {
        Name = "sps rccloud aws"
    }

}
resource "aws_s3_bucket_public_access_block" "S3bucketpublic" {
  bucket = "aws-rc-cloud"
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "s3StaticWeb" {
  bucket= "aws-rc-cloud"

  index_document {
    suffix = "index.html"
  }
}
