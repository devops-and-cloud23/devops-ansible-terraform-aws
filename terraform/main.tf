# Initiate the provider
provider "aws" {
    profile = "default"
    region = var.region
    /* access_key = var.ACCESS_KEY
    secret_key = var.SECRET_KEY */

}