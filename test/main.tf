variable "zone_id" {
  description = "Route53 hosted zone ID"
}

module "aws-cert" {
  source = "../"

  #  module_enabled = "false"

  domain                    = "*.example.com"
  zone_id                   = var.zone_id
  alternative_domains_count = 2
  alternative_domains = [
    "*.first.example.com",
    "*.second.example.com",
  ]
  tags {
    Name = "Example"
  }
}
