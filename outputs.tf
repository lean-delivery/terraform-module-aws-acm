output "certificate_arn" {
  description = "ARN of created certificate"
  value       = "${element(concat(aws_acm_certificate.aws.*.arn, list("")), 0)}"

  # value       = "${element(concat(aws_acm_certificate.aws.*.arn, aws_acm_certificate.import.*.arn, list("")), 0)}"
}

output "certificate_domain" {
  description = "Domain name for cert"
  value       = "${element(concat(aws_acm_certificate.aws.*.domain_name, list("")), 0)}"
}
