data "aws_lb" "lb" {
  tags = {
    "kubernetes.io/service-name" : "ingress-nginx/ingress-nginx-controller"
  }
}

resource "aws_api_gateway_vpc_link" "main" {
  name        = "vpc-link-${var.cluster_name}"
  target_arns = [data.aws_lb.lb.arn]
}

resource "aws_api_gateway_rest_api" "main" {
  name = "api-gtw-${var.cluster_name}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
