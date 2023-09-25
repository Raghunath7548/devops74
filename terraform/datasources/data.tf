data "aws_ami" "ami_id"{
    most_recent = true
    owners = ["amazon"] #you can give aws account also

    filter {
        name ="name"
        values = ["amzn2-ami-kernel-5.10-hvm-*.0-x86_64-gp2"]
    }
}

output "ami_id" {
  value = data.aws_ami.ami_id.id
}

data "aws_vpc" "default" {
  default = true
}

output "vpc_info" {
  value = data.aws_vpc.default
}

resource "aws_security_group" "allow-http" {
    name = "some-name"
    vpc_id = data.aws_vpc.default.id
      description = "allowing all port 80" # you can keep this in variable
      ingress {
      description      = "Allowing all inbound traffic"
      from_port        = 80 #this is number
      to_port          = 80 #this is number
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]

      }
      egress {
      from_port        = 0 #this is number
      to_port          = 0 #this is number
      protocol         = "-1" # all protocols 
      cidr_blocks      = ["0.0.0.0/0"]

      }
 

}
