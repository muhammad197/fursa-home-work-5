module "WebServers" {
    source = "./WebServers/"
    AmiName= "ami-0caef02b518350c8b"
    InstenceType= "t2.micro"
    Zone = "eu-central-1"
    key = "muhammad"

}

module "LoadBalancers" {
    source = "./loadBalancers/"
    nameofiternal = "internalLB"
    nameofinternet = "externalLB" 
}

module "ApplicationServer" {
    source = "./ApplicationServer/"
    at = "t2.micro"
    c = 4
}




resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket"

  tags = {
    Name        = "mybucket"
  }
}

resource "aws_db_instance" "myrdsdb" {
  identifier = "mysqldatabase"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  username             = "admin"
  password             = "password" 
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  parameter_group_name = "default.mysql5.7"
  port                 = 3306
  skip_final_snapshot  = true
  multi_az = true
}