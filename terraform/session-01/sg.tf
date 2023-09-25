resource "aws_security_group" "allow_all" {
    name = var.sg_name
    description = "allowing all port" # you can keep this in variable
    ingress {
        description      = "TLS from VPC"
        from_port        = 0 #this is number
        to_port          = 0 #this is number
        protocol         = "tcp"
        cidr_blocks      = var.sg_cidr
        
    }
    egress {
        from_port        = 0 #this is number
        to_port          = 0 #this is number
        protocol         = "-1" # all protocols 
        cidr_blocks      = var.sg_cidr
       
    }
}