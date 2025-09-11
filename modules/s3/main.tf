resource "aws_s3_bucket" "pro_s3" {
  bucket = "my-pro-s3-bucket-${random_id.suffix.hex}-${var.environment}"
  force_destroy = true
}

resource "random_id" "suffix" {
  byte_length = 4
}
