resource "aws_dynamodb_table" "gym_capacity" {
    name = var.dynamodb_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "timestamp"

    attribute {
      name = "timestamp"
      type = "S"
    }
}