output "first_LB" {
  value = aws_lb.internet_facing
}
output "second_LB" {
  value = aws_lb.internal
}