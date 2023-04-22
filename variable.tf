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