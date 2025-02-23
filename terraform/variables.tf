variable "dynamodb_table_name" {
    default = "GymCapacityData"
}

variable "lambda_function_name" {
    default = "StoreGymCapacity"
}

variable "aws_region" {
  default = "eu-west-2" # London
  description = "AWS region"
}