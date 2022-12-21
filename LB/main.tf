# Create an internet-facing load balancer
resource "aws_lb" "internet_facing" {
  name               = var.nameofinternet
  internal           = false
  load_balancer_type = "application"

}
resource "aws_lb_listener" "internet_facing" {
  load_balancer_arn = aws_lb.internet_facing.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb.internet_facing.arn
  }
}

# Create an internal load balancer
resource "aws_lb" "internal" {
  name               = var.nameofiternal
  internal           = true
  load_balancer_type = "application"
}
resource "aws_lb_listener" "internal" {
  load_balancer_arn = aws_lb.internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb.internal.arn
  }
}