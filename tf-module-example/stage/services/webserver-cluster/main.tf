provider "aws" {
    region = "us-east-1"
}


//importing module
module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"
    
    //Module params , make sure to have a corresponding input vars in the module dir
    cluster_name   = "webservers-stage"
    db_remote_state_bucket = "tfup-saiso12"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

    instance_type  = "t2.micro"
    min_size = 2
    max_size = 2
}


resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}


