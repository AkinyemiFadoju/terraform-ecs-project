#tfvars are used to assign values for our variables

#environment variables
region = "us-east-1"
project_title = "rentzone"
environment = "test"

#vpc variables
vpc_cidr = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.0.0/24"
public_subnet_az2_cidr = "10.0.1.0/24"
private_app_subnet_az1_cidr = "10.0.2.0/24"
private_app_subnet_az2_cidr = "10.0.3.0/24"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"

#security group variable
ssh_location = "216.197.247.251/32"

#rds variables
database_snapshot_identifier="dev-rds-db-snapshot"
database_instance_class="db.t2.micro"
database_instance_identifier="dev-rds-db"
multi_az_deployment="false"

#acm variables
domain_name = "akinyemifadoju.link"
alternative_name = "*.akinyemifadoju.link" #The "*." is how we request ssl certificate for alternative/subdomain name

#s3 variables
env_file_bucket_name = "af-ecs-env-file-bucket"
env_file_name = "rentzone.env"

#ecs variable
architecture = "ARM64" #ARM64 because Docker image was created on Mac; for Windows it will be "X64_64"
container_image = "926522733342.dkr.ecr.us-east-1.amazonaws.com/rentzone:latest"

#route 53 variable
record_name = "www"