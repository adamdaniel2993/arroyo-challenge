resource "random_password" "arroyo_db_password" {
  length  = 16
  special = false
}


resource "aws_db_instance" "arroyo-rds" {
  identifier             = "${local.proyect_name}-db"
  allocated_storage      = 20
  db_name                = "ArroyoDB"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  username               = local.proyect_name
  password               = random_password.arroyo_db_password.result
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.arroyo_db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.arroyo-db-subnet-group.id
}

resource "aws_db_subnet_group" "arroyo-db-subnet-group" {
  name       = "${local.proyect_name}-db-subnet-group"
  subnet_ids = [module.arroyo_vpc.private_subnets[0], module.arroyo_vpc.private_subnets[1]]
}


