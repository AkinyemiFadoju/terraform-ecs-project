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