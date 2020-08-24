terraform {
  backend "s3" {
    bucket  = "habib-tfstate"
    key     = "ec-ci.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}