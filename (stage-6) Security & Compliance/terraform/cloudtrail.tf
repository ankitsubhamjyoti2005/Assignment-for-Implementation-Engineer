resource "aws_cloudtrail" "onfinance_trail" {
  name                          = "onfinance-trail"
  s3_bucket_name                = aws_s3_bucket.onfinance_logs.bucket
  is_multi_region_trail         = true
  enable_logging                = true
  include_global_service_events = true
}


//note
//aws guardduty create-detector --enable #use to run
