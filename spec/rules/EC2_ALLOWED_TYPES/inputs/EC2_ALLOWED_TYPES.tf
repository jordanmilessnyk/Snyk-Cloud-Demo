resource "aws_instance" "valid" {
  instance_type = "t2.small"

  tags = {
    Environment = "DEV"
  }
}

resource "aws_instance" "invalid" {
  instance_type = "t2.micro"

  tags = {
    Environment = "DEV"
  }
}
