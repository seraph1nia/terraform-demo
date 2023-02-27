output "public_ip" {
  description = "Publiek ipadres"
  value       = aws_instance.nginx.public_ip
}