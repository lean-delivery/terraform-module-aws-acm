# Terraform AWS Certificate Manager module

Create and validate a Certificate with AWS Certificate manager.

## Example for AWS Issued certificate

```HCL
module "aws-cert" {
  source  = "github.com/lean-delivery/tf-module-aws-acm"
  domain   = "example.com"
  zone_id = "***********"
  alternative_domains = [
    "*.example.com",
    "*.foo.example.com"
  ]
  tags {
    Name = "Example"
  }
}
```

## Example for Imported certificate

```HCL
module "imported-cert" {
  source  = "github.com/lean-delivery/tf-module-aws-acm"
  
  aws_issued_cert   = "false"
  imported_cert     = "true"

  private_key       = "${var.private_key}"         # - (Required) The certificate's PEM-formatted private key
  certificate_body  = "${var.certificate_body}"    # - (Required) The certificate's PEM-formatted public key
  certificate_chain = "${var.certificate_chain}"   # - (Optional) The certificate's PEM-formatted chain

  tags {
    Name = "Example"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alternative\_domains | Domian name alternatives for ACM certificate | list | `<list>` | no |
| aws\_issued\_cert | Create AWS issued certificate (mutually exclusives with imported_cert) | string | `true` | no |
| certificate\_body | (Required for imported sertificate) The certificate's PEM-formatted public key | string | `` | no |
| certificate\_chain | (Optional for imported sertificate) The certificate's PEM-formatted chain | string | `` | no |
| domain | Domian name to request ACM certificate | string | - | yes |
| imported\_cert | Create imported certificate (mutually exclusives with aws_issued_cert) | string | `false` | no |
| module\_enabled | Switch to disable/enable module | string | `true` | no |
| private\_key | (Required for imported sertificate) The certificate's PEM-formatted private key | string | `` | no |
| tags | Tags | map | `<map>` | no |
| validate | Validate ACM certificates | string | `true` | no |
| zone\_id | Zone Id | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_arn | ARN of created/imported certificate |