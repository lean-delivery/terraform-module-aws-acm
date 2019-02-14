output "certificate_arn" {
  description = "ARN of created/imported certificate"
  value = "${element(concat(aws_acm_certificate.aws.*.arn, aws_acm_certificate.import.*.arn, list("")), 0)}"
}
