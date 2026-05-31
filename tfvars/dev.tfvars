resource_group_name      = "rg-dev-app"
location                 = "eastus"
vnet_name                = "vnet-dev-app"
vnet_address_space       = ["10.10.0.0/16"]
subnet_name              = "subnet-dev-app"
subnet_address_prefixes  = ["10.10.1.0/24"]

# VM variables (replace the SSH key value with your public key)
vm_name                 = "dev-simple-linux-vm"
vm_size                 = "Standard_B2s"
# admin_username can be left default (azureuser) or overridden
admin_username          = "azureuser"
admin_password = "Password@12345"
# IMPORTANT: set this to your SSH public key (ssh-rsa ...)
#admin_ssh_public_key    = "ssh-rsa #AAAAB3NzaC1yc2EAAAADAQABAAABAQ... replace-with-your-key"
os_disk_size_gb         = 30

# Optional: override image if needed
#image_publisher        = "Canonical"
#image_offer            = "UbuntuServer"
#image_sku              = "18.04-LTS"
#image_version          = "latest"