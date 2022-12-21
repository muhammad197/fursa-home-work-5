output "app_server_ips" {
  value = aws_instance.app_server.*.public_ip
}