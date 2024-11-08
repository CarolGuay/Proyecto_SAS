# Definir el grupo de recursos de Inspector  
resource "aws_inspector_resource_group" "my_resource_group" {  
  tags = {  
    Name = "MyResourceGroup"  
  }  
}  

# Definir la plantilla de evaluación de Inspector  
resource "aws_inspector_assessment_template" "assessment_template" {  
  name               = "MyAssessmentTemplate"  
  duration           = 60  
  target_resource_ids = [aws_inspector_resource_group.my_resource_group.arn]  
  rules_package_arns  = [  
    "arn:aws:inspector:us-east-1:123456789012:rulespackage/0-9hgA8AJr" # Reemplaza con el ARN de tu paquete de reglas real  
  ]  
}  

# Definir el bucket S3 para el análisis de datos  
resource "aws_s3_bucket" "data_analysis_datos" {  
  bucket = "data-analysis-datos"  
  acl    = "private"  
}
