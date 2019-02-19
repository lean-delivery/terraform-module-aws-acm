variable "zone_id" {
  description = "Route53 hosted zone ID"
}

module "aws-cert" {
  source = "../"

  module_enabled = "false"

  domain  = "*.test.brb-labs.com"
  zone_id = "${var.zone_id}"

  alternative_domains = [
    "*.first.test.brb-labs.com",
    "*.second.test.brb-labs.com",
  ]

  tags {
    Name = "Example"
  }
}
