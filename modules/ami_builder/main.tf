resource "aws_ami_from_instance" "app_ami" {
  name               = "app-ami"
  source_instance_id = var.app_instance_id

  tags = {
    Name          = "app-ami"
    creation_mode = "terraform"
    Owner         = "nikhil"
  }
}

resource "aws_ami_from_instance" "web_ami" {
  name               = "web-ami"
  source_instance_id = var.web_instance_id

  tags = {
    Name          = "web-ami"
    creation_mode = "terraform"
    Owner         = "nikhil"
  }
}
