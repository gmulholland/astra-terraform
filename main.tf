// Define the Astra provider for Terraform
terraform {
  required_providers {
    astra = {
      source = "datastax/astra"
      version = "0.0.5-pre"
    }
  }
}

// Provide your Astra token
provider "astra" {
}

// Create the database and initial keyspace
resource "astra_database" "dev" {
  name           = "starship"
  keyspace       = "life_support_systems"
  cloud_provider = "gcp"
  region         = "us-east1"
}

// Get the location of the secure connect bundle
//data "astra_secure_connect_bundle_url" "dev" {
//  database_id = astra_database.dev.id
//}

// Output the created database id
output "database_id" {
  value = astra_database.dev.id
}

// Output the download location for the secure connect bundle
//output "secure_connect_bundle_url" {
//  value = data.astra_secure_connect_bundle_url.dev.url
//}

