#---------------------------------------------------------
#Define Provider
#---------------------------------------------------------

variable ibmcloud_api_key {
  default = "3xlibMHImbejbAQLdu1zaWyArejAwAyuxul8TeeLu1tZ"
  description = "Ingresa el api key: 3xlibMHImbejbAQLdu1zaWyArejAwAyuxul8TeeLu1tZ"
} 

provider "ibm" {
  ibmcloud_api_key =  "${var.ibmcloud_api_key}"
  generation       = 1
}
