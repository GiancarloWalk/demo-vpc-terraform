#---------------------------------------------------------
# Get resource_group id
#---------------------------------------------------------

data "ibm_resource_group" "resource_group" {
  name = "${var.resource_group}"
}

#---------------------------------------------------------
# Create new VPC
#---------------------------------------------------------

resource "ibm_is_vpc" "vpc1" {
  name                = "${var.vpc-name}"
  resource_group      = "${data.ibm_resource_group.resource_group.id}"
}

#---------------------------------------------------------
## Create Subnets in Zone
#---------------------------------------------------------
#subnet Bastion
resource "ibm_is_subnet" "bastion-subnet" {
  name            = "${var.vpc-name}-${var.zone}-bastion"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone}"
  ipv4_cidr_block = "${var.vpc-secure-bastion-subnet}"
}
#subnet frontend
resource "ibm_is_subnet" "frontend-subnet" {
  name            = "${var.vpc-name}-${var.zone}-frontend"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone}"
  ipv4_cidr_block = "${var.vpc-pubpriv-frontend-subnet}"
}

#subnet backend
resource "ibm_is_subnet" "backend-subnet" {
  name            = "${var.vpc-name}-${var.zone}-backend"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone}"
  ipv4_cidr_block = "${var.vpc-pubpriv-backend-subnet}"
}