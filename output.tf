# website url
output "website_url" {
  value     = join ("", ["https://", var.record_name, ".", var.domain_name])
}