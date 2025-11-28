output "policy" {
  description = "The generic integration test policy JSON"
  value       = data.aws_iam_policy_document.this.json
}
