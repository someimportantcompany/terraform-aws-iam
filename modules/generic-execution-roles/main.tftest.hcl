provider "aws" {
  access_key = "EXAMPLE-AWS-ACCESS-KEY-ID"
  secret_key = "EXAMPLE-AWS-SECRET-ACCESS-KEY"
  region     = "us-east-1"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

run "generic_execution_roles" {
  command = plan

  assert {
    condition     = aws_iam_role_policy_attachment.ecs_tasks.role == aws_iam_role.ecs_tasks.name
    error_message = "ECS Task Role is not configured correctly"
  }

  assert {
    condition     = aws_iam_role_policy_attachment.lambda.role == aws_iam_role.lambda.name
    error_message = "ECS Task Role is not configured correctly"
  }
}
