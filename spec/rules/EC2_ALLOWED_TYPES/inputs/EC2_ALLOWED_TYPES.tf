resource "aws_instance" "valid" {
  instance_type = "t2.medium"
}

resource "aws_instance" "invalid" {
  instance_type = "t2.micro"
}
