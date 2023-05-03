#variables values are assigned in out tfvars file

variable "region" {
  description = "region to create resources"
  type = string
}

variable "environment" {
  description = "execution environment"
  type = string
}

variable "project_title" {
  description = "title of project"
  type = string
}

variable "vpc_cidr" {
  description = "vpc cidr block"
  type = string
}

variable "public_subnet_az1_cidr" {
  description = "Public Subnet az1 cidr"
  type = string
}

variable "public_subnet_az2_cidr" {
  description = "Public Subnet az2 cidr"
  type = string
}

variable "private_app_subnet_az1_cidr" {
  description = "Public app Subnet az1 cidr block"
  type = string
}

variable "private_app_subnet_az2_cidr" {
  description = "Public app Subnet az2 cidr block"
  type = string
}

variable "private_data_subnet_az1_cidr" {
  description = "Public data Subnet az1 cidr block"
  type = string
}

variable "private_data_subnet_az2_cidr" {
  description = "Public data Subnet az2 cidr block"
  type = string
}

#security group variable
variable "ssh_location" {
  description = "IP address that can SSH into the server"
  type = string
}

#database snapshot variable
variable "database_snapshot_identifier" {
  description = "database snapshot name"
  type = string
}

variable "database_instance_class" {
  description = "database instance type"
  type = string
}

variable "database_instance_identifier" {
  description = "database instance identifier"
  type = string
}

variable "multi_az_deployment" {
  description = "create a standby DB instance"
  type = bool
}

#acm variables
variable "domain_name" {
  description = "Domain name"
  type = string
}

variable "alternative_name" {
  description = "Sub-domain name"
  type = string
}

#s3 variables
variable "env_file_bucket_name" {
  description = "s3 bucket name"
  type = string
}

variable "env_file_name" {
  description = "Env file name"
  type = string
}

#ecs variable
variable "architecture" {
  description = "ecs cpu architecture"
  type = string
}

variable "container_image" {
  description = "container image uri"
  type = string
}

#route 53 variables
variable "record_name" {
  description = "sub domain name"
  type = string
}