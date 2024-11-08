# variables.tf  
variable "email_itsistemas" {  
  description = "Email para el IT Account"  
  type        = string  
  default     = "itsistemas36@gmail.com"  
}  

variable "bucket_data_analisis" {  
  description = "ARN del bucket de análisis"  
  type        = string  
  default     = "arn:aws:s3:::data-analisis-datos"  
}