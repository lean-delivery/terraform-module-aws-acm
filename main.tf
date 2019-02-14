resource "aws_acm_certificate" "aws" {
  count                     = "${ var.module_enabled && var.aws_issued_cert && ! var.imported_cert ? 1 : 0 }"
  domain_name               = "${var.domain}"
  subject_alternative_names = ["${var.alternative_domains}"]

  validation_method = "DNS"

  tags = "${var.tags}"
}

resource "aws_acm_certificate" "import" {
  count             = "${ var.module_enabled && ! var.aws_issued_cert && var.imported_cert ? 1 : 0 }"
  private_key       = "${var.private_key}"                                                            # - (Required) The certificate's PEM-formatted private key
  certificate_body  = "${var.certificate_body}"                                                       # - (Required) The certificate's PEM-formatted public key
  certificate_chain = "${var.certificate_chain}"                                                      # - (Optional) The certificate's PEM-formatted chain

  tags = "${var.tags}"
}

resource "aws_route53_record" "this" {
  count   = "${ var.module_enabled && var.aws_issued_cert && ! var.imported_cert ? 1 : 0 }"
  name    = "${lookup(aws_acm_certificate.aws.0.domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.aws.0.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${var.zone_id}"
  records = ["${lookup(aws_acm_certificate.aws.0.domain_validation_options[count.index], "resource_record_value")}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "this" {
  count                   = "${ var.module_enabled && var.aws_issued_cert && ! var.imported_cert ? 1 : 0 }"
  certificate_arn         = "${aws_acm_certificate.aws.arn}"
  validation_record_fqdns = ["${aws_route53_record.this.*.fqdn}"]
}
