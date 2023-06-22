terraform {
  backend "s3" {
    bucket = "my-first-task-to-create-a-bucket"
    key    = "terraform-state"
    region = "us-east-1"
  }
}