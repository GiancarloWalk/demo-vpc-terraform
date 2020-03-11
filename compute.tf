
#---------------------------------------------------------
# Create instances in each subnet
#---------------------------------------------------------
resource "ibm_is_instance" "vsi-bastion" {
  count   = "1"
  name    = "${var.vsi-bastion-name}"
  image   = "${var.image}"
  profile = "${var.vsi-profile-bastion}"

  primary_network_interface = {
    subnet          = "${ibm_is_subnet.bastion-subnet.id}"
    security_groups = ["${ibm_is_security_group.bastion-sg.id}"]
  }

  vpc                 = "${ibm_is_vpc.vpc1.id}"
  zone                = "${var.zone}"
  /*keys                = ["${ibm_is_ssh_key.sshkey.id}"]*/
  resource_group      = "${data.ibm_resource_group.resource_group.id}"
}


resource "ibm_is_instance" "vsi-frontend" {
  count   = "1"
  name    = "${var.vsi-frontend-name}"
  image   = "${var.image}"
  profile = "${var.vsi-profile-frontend}"

  primary_network_interface = {
    subnet          = "${ibm_is_subnet.frontend-subnet.id}"
    security_groups = ["${ibm_is_security_group.frontend-sg.id}","${ibm_is_security_group.maintenance-sg.id}"]
  }

  vpc                 = "${ibm_is_vpc.vpc1.id}"
  zone                = "${var.zone}"
  /*keys                = ["${ibm_is_ssh_key.sshkey.id}"]*/
  /*user_data           = "${file("${var.filepath_frontend_init}")}"*/
  resource_group      = "${data.ibm_resource_group.resource_group.id}"
}

resource "ibm_is_instance" "vsi-backend" {
  count   = "1"
  name    = "${var.vsi-backend-name}"
  image   = "${var.image}"
  profile = "${var.vsi-profile-backend}"

  primary_network_interface = {
    subnet          = "${ibm_is_subnet.backend-subnet.id}"
    security_groups = ["${ibm_is_security_group.backend-sg.id}","${ibm_is_security_group.maintenance-sg.id}"]
  }
  
  vpc                 = "${ibm_is_vpc.vpc1.id}"
  zone                = "${var.zone}"
  /*keys                = ["${ibm_is_ssh_key.sshkey.id}"]*/
  /*user_data           = "${file("${var.filepath_backend_init}")}"*/
  resource_group      = "${data.ibm_resource_group.resource_group.id}"
}

#---------------------------------------------------------
# Assign floating IPs
#---------------------------------------------------------

resource "ibm_is_floating_ip" "vsi-bastion-fip" {
  count     = "1"
  name    = "${var.vsi-bastion-name}-${var.zone}-fip"
  target  = "${ibm_is_instance.vsi-bastion.primary_network_interface.0.id}"
}

resource "ibm_is_floating_ip" "vsi-frontend-fip" {
  count     = "1"
  name    = "${var.vsi-frontend-name}-${var.zone}-fip"
  target  = "${ibm_is_instance.vsi-frontend.primary_network_interface.0.id}"
}
