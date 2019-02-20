variable "module_enabled" {
  description = "Switch to disable/enable module"
  default     = "true"
}

# variable "aws_issued_cert" {
#   description = "Create AWS issued certificate (mutually exclusives with imported_cert)"
#   default     = "true"
# }

# variable "imported_cert" {
#   description = "Create imported certificate (mutually exclusives with aws_issued_cert)"
#   default     = "false"
# }

variable "domain" {
  description = "Domian name to request ACM certificate"
}

variable "zone_id" {
  description = "Zone Id"
}

variable "alternative_domains" {
  description = "Domian name alternatives for ACM certificate"
  default     = []
}

variable "alternative_domains_count" {
  description = "Count of Domian name alternatives for ACM certificate"
  default     = "0"
}

variable "validate" {
  description = "Validate ACM certificates"
  default     = "true"
}

variable "private_key" {
  description = "(Required for imported sertificate) The certificate's PEM-formatted private key"
  default     = ""
}

variable "certificate_body" {
  description = "(Required for imported sertificate) The certificate's PEM-formatted public key"
  default     = ""
}

variable "certificate_chain" {
  description = "(Optional for imported sertificate) The certificate's PEM-formatted chain"
  default     = ""
}

variable "tags" {
  description = "Tags"
  default     = {}
}
