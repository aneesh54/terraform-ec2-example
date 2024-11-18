variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region for resources"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type for EC2"
}

variable "ami_id" {
  default     = "ami-0c02fb55956c7d316" # Replace with a valid AMI ID
  description = "AMI ID for the instance"
}

