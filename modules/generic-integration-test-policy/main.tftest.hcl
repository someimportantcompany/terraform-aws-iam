provider "aws" {
  access_key = "EXAMPLE-AWS-ACCESS-KEY-ID"
  secret_key = "EXAMPLE-AWS-SECRET-ACCESS-KEY"
  region     = "us-east-1"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

run "generic_integration_test_policy" {
  command = plan

  assert {
    condition     = length(data.aws_iam_policy_document.this.json) <= 6144
    error_message = "AWS IAM policy should be less than 6,144 characters"
  }
}
