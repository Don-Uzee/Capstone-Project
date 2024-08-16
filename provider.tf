# provider to use azure 
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

#create the resource group in azure
resource "azurerm_resource_group" "main" {
  name     = "socks-shop-resources"
  location = "northeurope"
}

// provider "kubernetes" {
//   config_path = "C:\\Users\\nonso\\.kube\\config"
// }

