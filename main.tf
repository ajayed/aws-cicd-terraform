resource "aws_elastic_beanstalk_application" "webtest1" {
  name        = "web-test-name"
  description = "web-test-desc"
}

resource "aws_elastic_beanstalk_environment" "webenvtest" {
  name                = "web-test-name"
  application         = "${aws_elastic_beanstalk_application.webtest1.name}"
  solution_stack_name = "64bit Amazon Linux 2 v5.1.0 running Node.js 12"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role "
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-0b6c8e8bf4dbf3bb0"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0aa1f023eb4fb348c"
  }
}
