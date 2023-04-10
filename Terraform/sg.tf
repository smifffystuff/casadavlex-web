resource "aws_security_group" "alb_sg" {
  name = "casadavlex-lb-sg"
  vpc_id = aws_vpc.casadavlex_vpc.id

  ingress {
    protocol = "tcp"
    from_port = var.app_ssl_port
    to_port = var.app_ssl_port
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    protocol = "tcp"
    from_port = var.app_port
    to_port = var.app_port
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_security_group" "ecs_sg" {
  name = "casadavlex-ecs-sg"
  vpc_id = aws_vpc.casadavlex_vpc.id

  ingress {
    protocol = "tcp"
    from_port = var.app_port
    to_port = var.app_port
    security_groups = [ aws_security_group.alb_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}