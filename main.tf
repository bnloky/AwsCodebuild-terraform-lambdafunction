provider "aws" {
 access_key = var.aws_access_key
 secret_key = var.aws_secret_key
 region     = var.aws_region
}

terraform {
  required_version = ">= 1.5.6"
  backend "s3" {
    bucket = "codebuild-aws-lambdafunction"  
    key    = "tffiles.tfstate"                  
    region = "ap-south-1"
  }
}

resource "aws_lambda_function" "my_function" {
    role = "arn:aws:iam::681217613251:role/service-role/codebuild-mylambdafunctionThi-service-role"
    function_name = "my_lambda_function1"
    runtime = "python3.8"
    handler = "index.handler"
    timeout = 300
    filename = data.archive_file.lambda_function_archive.output_path
    source_code_hash = filebase64sha256(data.archive_file.lambda_function_archive.output_path)
}

data "archive_file" "lambda_function_archive" {
  type        = "zip"
  source_dir  =  "/lambdafunction"      # Path to the directory containing your Lambda function code
  output_path = "/lambdafunction.zip"   # Path where you want to save the generated zip archive
}

