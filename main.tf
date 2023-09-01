provider "aws"  {
region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "codebuild-aws-lambdafunction"  
    key    = "tffiles.tfstate"                  
    region = "ap-south-1"
  }
}