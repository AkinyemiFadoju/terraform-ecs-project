# create database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "${var.project_title}-${var.environment}-database-subnets"
  subnet_ids  = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az2.id]
  description = "subnets for database instance"

  tags = {
    Name = "${var.project_title}-${var.environment}-database-subnets"
  }
}

# get information about a database snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.database_snapshot_identifier
  most_recent            = true
  snapshot_type          = "manual"
}

# launch an rds instance from a database snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.database_instance_class
  skip_final_snapshot    = true  #prevent final shot from creating after terraform destroy has been executed
  availability_zone      = data.aws_availability_zones.available_zones.names[1]
  identifier             = var.database_instance_identifier #name we give our rds instance
  snapshot_identifier    = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.id
  multi_az               = var.multi_az_deployment
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}