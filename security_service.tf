resource "aws_inspector_resource_group" "my_resource_group" {  
  tags = {  # Reemplaza resource_group_tags con tags  
    Name = "MyResourceGroup"  
  }  
}  

resource "aws_inspector_assessment_template" "assessment_template" {  
  name                = "MyAssessmentTemplate"  
  duration            = 60  
  target_arn         = aws_inspector_resource_group.my_resource_group.arn  
  rules_package_arns  = [  
    "arn:aws:s3:::data-analisis-datos"  # Reemplaza con tu ARN de paquete de reglas real  
  ]  
}  