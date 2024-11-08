resource "aws_macie2_classification_job" "data_analysis_job" {  
  job_type     = "ONE_TIME"  
  name        = "data-analysis-job"  
  description = "One-time job to classify sensitive data in the data-analysis-datos bucket"  

  s3_job_definition {  
    bucket_definitions {  
      account_id = data.aws_caller_identity.current.account_id  
      buckets    = ["${var.bucket_data_analisis}"]  
    }  
  }  

  sampling_percentage = 100  

  depends_on = [  
    aws_organizations_account.finance_account,  
    aws_organizations_account.hr_account,  
    aws_organizations_account.it_account  
  ]  
}