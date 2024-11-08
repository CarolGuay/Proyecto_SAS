provider "aws" { 
  alias = "us-west" 
  region = "us-east-1"  
}  

data "aws_organizations_organization" "current" {}  

# Crear la Unidad Organizativa "Finance"  
resource "aws_organizations_organizational_unit" "finance_ou" {  
  name      = "Finance"  
  parent_id = data.aws_organizations_organization.current.roots[0].id  
}  

# Crear la Unidad Organizativa "HR"  
resource "aws_organizations_organizational_unit" "hr_ou" {  
  name      = "HR"  
  parent_id = data.aws_organizations_organization.current.roots[0].id  
}  

# Crear la cuenta "FinanceAccount"  
resource "aws_organizations_account" "finance_account" {  
  name      = "FinanceAccount"  
  email     = "finanzassistemas2@gmail.com"  
  role_name = "OrganizationAccountAccessRole"  
  # Asignar la cuenta a la OU de Finanzas  
  parent_id = aws_organizations_organizational_unit.finance_ou.id  
}  

# Crear la cuenta "HRAccount"  
resource "aws_organizations_account" "hr_account" {  
  name      = "HRAccount"  
  email     = "rrhhav2020@gmail.com"  
  role_name = "OrganizationAccountAccessRole"  
  # Asignar la cuenta a la OU de Recursos Humanos  
  parent_id = aws_organizations_organizational_unit.hr_ou.id  
}

# Crear la Unidad Organizativa "IT"  
resource "aws_organizations_organizational_unit" "it_ou" {  
  name      = "IT"  
  parent_id = data.aws_organizations_organization.current.roots[0].id   
}  

# Crear la cuenta "ITAccount"  
resource "aws_organizations_account" "it_account" {  
  name      = "ITAccount"  
  email     = "itsistemas36@gmail.com"  
  role_name = "OrganizationAccountAccessRole"  
  # Asignar la cuenta a la OU de IT   
  parent_id = aws_organizations_organizational_unit.it_ou.id  
}

