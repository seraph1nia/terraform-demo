
variable "subnet_id" {
  description = "In welk subnet de instance komt"
  type        = string
}

variable "vpc_id" {
  description = "In welk vpc de security group komt"
  type        = string
}

variable "size" {
  description = "Welke size de instance krijgt"
  type        = string
  default     = "t2.nano"
}

variable "tags" {
  description = "Maps dictionary die aan de ec2 wordt meegegeven"
  type        = map(string)
  default     = {}
}