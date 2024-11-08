provider "aws" {  
  region = "us-east-1" # Asegúrate de que esto coincide con la región donde están tus cuentas  
}  

data "aws_organizations_organization_2" "current" {}  

# Habilitar AWS Security Hub en cada cuenta  
resource "aws_securityhub_account" "security_hub" {  
  provider = aws  
}  

# Crear una configuración por cada cuenta que desees habilitar  
resource "aws_securityhub_member" "finance_member" {  
  account_id = aws_organizations_account.finance_account.id  
  email      = "finanzassistemas2@gmail.com" # Asegúrate de cambiar al email de la cuenta adecuada  

  depends_on = [aws_securityhub_account.security_hub]  
}  

resource "aws_securityhub_member" "hr_member" {  
  account_id = aws_organizations_account.hr_account.id  
  email      = "rrhhav2020@gmail.com" # Asegúrate de cambiar al email de la cuenta adecuada  

  depends_on = [aws_securityhub_account.security_hub]  
}

resource "aws_securityhub_member" "it_member" {  
  account_id = aws_organizations_account.it_account.id  
  email      = "itsistemas36@gmail.com" # Asegúrate de cambiar al email de la cuenta adecuada  

  depends_on = [aws_securityhub_account.security_hub]  
}

#Habilitar reglas de conformidad (compliance)
resource "aws_securityhub_standards_subscription" "cis_benchmark" {  
  standard_arn = "arn:aws:securityhub:us-east-1::standards/cis-aws-foundations-benchmark/v/1.2.0"  
  depends_on   = [aws_securityhub_account.security_hub]  
}


#Centralizacion de Hallazgos

resource "aws_securityhub_organization_configuration" "organization_configuration" {  
  auto_enable = true  
  depends_on  = [aws_securityhub_account.security_hub]  
}  

resource "aws_macie2_s3_bucket_association" "bucket_association" {  
  bucket_arn = "arn:aws:s3:::data-analisis-datos"  
  depends_on = [aws_securityhub_security_hub]  
}  

resource "aws_macie2_job" "sensitive_data_scan" {  
  name = "SensitiveDataScan"  
  job_type = "SENSITIVE_DATA_DISCOVERY"  

  s3_job_definition {  
    bucket_definitions {  
      bucket_arn = "arn:aws:s3:::data-analisis-datos"  
    }  
  }  

  depends_on = [aws_macie2_s3_bucket_association.bucket_association]  
}  
