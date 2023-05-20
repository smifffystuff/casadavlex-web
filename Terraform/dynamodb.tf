resource "aws_dynamodb_table" "lodge_bookings_dynamodb_table" {
  name           = "LodgeBookings"
  billing_mode   = "PAY_PER_REQUEST"
#   read_capacity  = 5
#   write_capacity = 5
  hash_key       = "Date"

  attribute {
    name = "Date"
    type = "S"
  }

  

  tags = {
    Name        = "LodgeBookings"
    Environment = "production"
  }
}