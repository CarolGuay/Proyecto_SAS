resource "aws_s3_bucket" "data_analysis_datos" {  
  bucket = "data-analysis-datos"  
  acl    = "private"  
}  

resource "aws_s3_bucket_acl" "data_analysis_datos_acl" {  
  bucket = aws_s3_bucket.data_analysis_datos.id  
  acl    = "private"  
}  

resource "aws_inspector_resource_group" "my_resource_group" {  
  tags = {  
    Name = "My Resource Group"  
  }  
}  

resource "aws_inspector_assessment_template" "assessment_template" {  
  name       = "my-assessment-template"  
  target_arn = aws_inspector_resource_group.my_resource_group.arn  
  duration   = 3600  
  rules_package_arns = [  
    "arn:aws:inspector:us-east-1:inspector:rules-package/0-9hgA48vF",  
    "arn:aws:inspector:us-east-1:inspector:rules-package/0-R01qwB5Q",  
    "arn:aws:inspector:us-east-1:inspector:rules-package/0-L3Z9ybkY",  
    "arn:aws:inspector:us-east-1:inspector:rules-package/0-PmNV0Tcd",  
  ]  
}
