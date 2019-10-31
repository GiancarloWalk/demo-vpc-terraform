#---------------------------------------------------------
# Create sshkey from file
#---------------------------------------------------------
resource "ibm_is_ssh_key" "sshkey" {
  name       = "vpc-ssh-key"
  public_key = "${file(var.ssh_public_key)}"
  #No me permite guardarlo en un grupo de recursos específico vía Terraform, lo guarda en el rg por defecto
}

