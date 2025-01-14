terraform {  
  backend "azurerm" {
storage_account_name    = "tfex120"
        resource_group_name     = "tfex120"
        container_name          = "tfexc120" 
        key                     = "terraform.tfstate"
        access_key              = "2kQHCQ0+x7Nyf8WhMm3rG5UXptUx/Jbeceoz0XDncLzkZvsetb3Z3iCaSFXwLKRCj5UMr/cDGYVj+AStPWV3zA=="
    }
}
provider "azurerm" {
  features {}
}
resource "azurerm_service_plan" "main" {
  name                = "docker-dotnet-app"
  resource_group_name = "tf-example"
  location            = "eastus"
  os_type                = "Linux"
  sku_name		= "B1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "dockerappservice2000"
  resource_group_name = "tf-example"
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.main.id
  site_config {}
}

/*
resource "azurerm_app_service" "main" {
  name                = "docker-app-service"
  location            = "eastus"
  resource_group_name = "tfex120"
  app_service_plan_id = "${azurerm_service_plan.main.id}"
}
*/
