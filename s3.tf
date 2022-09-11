resource "aws_s3_bucket" "codedeploy_s3" {
  bucket = "cd-bucket10"

  tags = {
    Name = "codedeploy"
  }
}