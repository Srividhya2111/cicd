provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
  ami           = "ami-0dee22c13ea7a9a67"  # Ubuntu 22.04
  instance_type = "t2.micro"
  key_name      = "mykey"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              cd /var/www/html
              echo "<h1>Hello from Food Truck Website</h1>" > index.html
              EOF

  tags = {
    Name = "FoodtruckServer"
  }
}
