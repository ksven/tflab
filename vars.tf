variable "public_cidr_block" {
  description = "Public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24", "10.10.5.0/24"]

}

variable "availability_zones_index" {
  type    = list(string)
  default = ["a", "b", "c"]

}