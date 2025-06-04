provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "braedon-s3-bucket-unique9876" 
}

resource "aws_s3_object" "data_folder" {
  bucket  = aws_s3_bucket.my_bucket.id
  key     = "data-files/"
  content = ""
}

resource "aws_s3_object" "customers_upload" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "data-files/customers.csv"
  source = "files/customers.csv"
  content_type = "text/csv"
  etag = filemd5("files/customers.csv")
}

resource "aws_s3_object" "sales_upload" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "data-files/sales.csv"
  source = "files/sales.csv"
  content_type = "text/csv"
  etag = filemd5("files/sales.csv")
}
