variable "domain" {
  type = string
  description = "Base Domain Name of the Hosted Zone the application will work at (Hosted Zone should be created manually to prevent NS records changes)"
}

variable "request_ssl_certificate" {
  type = bool
  description = "Enable SSL certificate creation for the domain"
  default = true
}
