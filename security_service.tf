# security_services.tf  
resource "aws_guardduty_detector" "detector" {  
  enable = true  
}  

resource "aws_inspector_resource_group" "my_resource_group" {  
  resource_group_tags {  
    key   = "Name"  
    value = "MyResourceGroup"  
  }  
}  

resource "aws_inspector_assessment_template" "assessment_template" {  
  name                    = "MyAssessmentTemplate"  
  duration                = 60  
  target_arn             = aws_inspector_resource_group.my_resource_group.arn  
}