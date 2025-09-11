module "s3" {
    source = "./modules/s3"
    environment = var.environment
    //bucket = "my-pro-s3-bucket-${random_id.suffix.hex}-$var.environemnt" 
}

module "iam" {
    source = "./modules/iam"
    environment = var.environment
    s3_bucket_arn = module.s3.bucket_arn

}

module "vpc" {
    source = "./modules/vpc"
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    pub_cidr = var.pub_cidr
    pri_cidr = var.pri_cidr
    az = var.az
    
}