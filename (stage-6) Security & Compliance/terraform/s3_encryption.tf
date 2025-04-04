resource "aws_s3_bucket" "onfinance_data" {
  bucket = "onfinance-secure-data"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.onfinance_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = "alias/my-kms-key"
    }
  }
}
