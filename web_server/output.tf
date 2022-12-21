output "first_instence" {
  value = aws_instance.web_server.*.id
}