resource "aws_security_group" "arroyo_ec2_sg" {
  name   = "${local.proyect_name}-ec2-sg"
  vpc_id = module.arroyo_vpc.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    security_groups = [aws_security_group.arroyo_lb_sg.id]

  }

  #dejare esta regla comentada hasta la revision del challenge, esta regla permite conexiones ssh a las instancias del cluster, el cidr_block 0.0.0.0 es un ejemplo
#    ingress {
#    from_port       = 22
#    to_port         = 22
#    protocol        = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#
#  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${local.proyect_name}-ec2-sg"
  }
}

##### RDS security groups

resource "aws_security_group" "arroyo_db_sg" {
  name   = "${local.proyect_name}-db-sg"
  vpc_id = module.arroyo_vpc.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    security_groups = ["0.0.0.0/0"] #ec2

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${local.proyect_name}-db-sg"
  }
}


#### Load Balancer security groups

resource "aws_security_group" "arroyo_lb_sg" {
  name   = "${local.proyect_name}-lb-sg"
  vpc_id = module.arroyo_vpc.vpc_id

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
  tags = {
    Name = "${local.proyect_name}-lb-sg"
  }
}