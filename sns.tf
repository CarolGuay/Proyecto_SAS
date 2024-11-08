# sns.tf  
resource "aws_sns_topic" "alertas_sns" {  
  name = "AlertasS3AccesoNoAutorizado"  
}  

resource "aws_sns_topic_subscription" "suscripcion_email" {  
  topic_arn = aws_sns_topic.alertas_sns.arn  
  protocol  = "email"  
  endpoint  = "tu_email@ejemplo.com"  # Cambia esto a tu correo   
}