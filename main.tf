provider "aws" {
 access_key = var.aws_access_key
 secret_key = var.aws_secret_key
 region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "codebuild-aws-lambdafunction"  
    key    = "tffiles.tfstate"                  
    region = "ap-south-1"
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}