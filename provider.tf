#---------------------------------------------------------
#Define Provider
#---------------------------------------------------------

variable ibmcloud_api_key {
  description = "Ingresar el api key"
} 

provider "ibm" {
  ibmcloud_api_key =  "${var.ibmcloud_api_key}"
  generation       = 1
}
