terraform {
  backend "s3" {
    bucket         = "zikarad-deployments"
    key            = "state/aws_ecs-terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "deployments"
  }
}
