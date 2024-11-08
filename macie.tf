resource "aws_macie2_s3_bucket_association" "bucket_association" {  
  bucket_arn = "arn:aws:s3:::data-analisis-datos" # Cambia esto por el ARN de tu bucket que deseas evaluar  
  depends_on  = [aws_securityhub_account.security_hub]  
}

resource "aws_macie2_job" "macie_sensitive_data_scan" {  
  name = "SensitiveDataScan"  
  job_type = "SENSITIVE_DATA_DISCOVERY"  

  s3_job_definition {  
    bucket_definitions {  
      bucket_arn = "arn:aws:s3:::data-analisis-datos" # Cambia esto por el ARN de tu bucket que deseas escanear  
    }  
  }  

  depends_on = [aws_macie2_s3_bucket_association.bucket_association]  
}