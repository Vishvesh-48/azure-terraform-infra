variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefix for subnet"
  type        = list(string)
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "simple-linux-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  default     = "Password@12345"
  sensitive   = true
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 30
}

variable "image_publisher" {
  description = "Image publisher for the VM"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Image offer for the VM"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "Image SKU for the VM"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Image version for the VM"
  type        = string
  default     = "latest"
}

# storage account 

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "tfstorageacct001"
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "GRS"
}