provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Create a security group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your IP for security
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Replace with a valid AMI ID
  instance_type = "t2.micro"              # Adjust instance type as needed

  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyGitHubTerraformEC2"
  }
}

