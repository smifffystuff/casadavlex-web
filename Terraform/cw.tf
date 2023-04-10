resource "aws_cloudwatch_log_group" "casadavlex_log_group" {
  name              = "/ecs/casadavlex"
  retention_in_days = 5

  tags = {
    Name = "cw-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "casadavlex_log_stream" {
  name           = "casadavlex-log-stream"
  log_group_name = aws_cloudwatch_log_group.casadavlex_log_group.name
}