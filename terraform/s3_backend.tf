# Create s3 bucket to store terraform state
resource "aws_s3_bucket" "devops-project-terraform-state-elfn" {
  bucket = "devops-project-terraform-state-elfn"                 # Globally unique name for the new S3 bucket
  acl    = "private"                                       # Access control level, set to "private" to prevent public access
  # region         = "us-east-2"   # AWS region this bucket resides in.
  force_destroy = true

    tags = {
    Nom       = "Terraform state bucket"                          # Tag with the key "Name" and value "MyBucket"
    # Environnement = "Production"                           # Tag indicating the environment, in this case "Production"
  }
}

# Cette ressource "null_resource" sera utilisée pour supprimer le contenu d'un bucket S3.
resource "null_resource" "delete_bucket_content" {
  # Les déclencheurs dépendent de l'ID du bucket S3 que nous voulons vider.
  triggers = {
    bucket_id = aws_s3_bucket.devops-project-terraform-state-elfn.id
  }

  # Cette ressource dépend de la création ou de la modification du bucket S3.
  depends_on = [aws_s3_bucket.devops-project-terraform-state-elfn]
  
  # Utilisation du provisioner "local-exec" pour exécuter une commande locale.
  provisioner "local-exec" {
    # Commande pour supprimer récursivement tous les objets du bucket S3.
    command = <<-EOT
      aws s3 rm s3://${aws_s3_bucket.devops-project-terraform-state-elfn.id} --recursive
    EOT
  }
}



# Configure the s3 bucket
 /* terraform {
  backend "s3" {
    profile = "default" # change to desired profile
    bucket         = "devops-project-terraform-state-elfn"   # Name of the S3 bucket where Terraform state will be stored
    key            = "prod-01/terraform.tfstate"       # Path to the state file within the bucket
    region         = "us-east-1"                           # AWS region for the bucket
  #  encrypt        = true                                  # Request AWS to encrypt the state file at rest
  #  dynamodb_table = "nom-de-ma-table-dynamodb"            # Name of the DynamoDB table used for state locking to prevent state conflicts
  }
}  */

