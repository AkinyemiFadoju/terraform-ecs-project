# configure aws provider to establish a secure connection between terraform and aws
provider "aws" {
  region  = var.region
  profile = "Akinyemi-user1"

  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_title
      "Environment" = var.environment
    }
  }
}