#---------------------------------------------------------
# bastion Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "bastion-sg" {
  name = "vpc-secure-bastion-sg"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}
#Inbound
resource "ibm_is_security_group_rule" "bastion-sg-r1" {
  group      = "${ibm_is_security_group.bastion-sg.id}"
  direction  = "inbound"
  tcp = {
        port_min = 22
        port_max = 22
  }
  remote  = "0.0.0.0/0"
}
#Outbound
resource "ibm_is_security_group_rule" "bastion-sg-r2" {
  group      = "${ibm_is_security_group.bastion-sg.id}"
  direction  = "inbound"
  icmp = {
        type = 8
        code = 0
  }
  remote  = "0.0.0.0/0"
}


#---------------------------------------------------------
# maintenance Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "maintenance-sg" {
  name = "vpc-secure-maintenance-sg"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}
#Inbound
resource "ibm_is_security_group_rule" "maintenance-sg-r1" {
  group      = "${ibm_is_security_group.maintenance-sg.id}"
  direction  = "inbound"
  tcp = {
        port_min = 22
        port_max = 22
  }
  remote  = "${ibm_is_security_group.bastion-sg.id}"
}
#Outbound
resource "ibm_is_security_group_rule" "maintenance-sg-r2" {
  group      = "${ibm_is_security_group.maintenance-sg.id}"
  direction  = "outbound"
  tcp = {
        port_min = 80
        port_max = 80
  }
  remote  = "0.0.0.0/0"
}
resource "ibm_is_security_group_rule" "maintenance-sg-r3" {
  group      = "${ibm_is_security_group.maintenance-sg.id}"
  direction  = "outbound"
  tcp = {
        port_min = 443
        port_max = 443
  }
  remote  = "0.0.0.0/0"
}
resource "ibm_is_security_group_rule" "maintenance-sg-r4" {
  group      = "${ibm_is_security_group.maintenance-sg.id}"
  direction  = "outbound"
  tcp = {
        port_min = 53
        port_max = 53
  }
  remote  = "0.0.0.0/0"
}
resource "ibm_is_security_group_rule" "maintenance-sg-r5" {
  group      = "${ibm_is_security_group.maintenance-sg.id}"
  direction  = "outbound"
  udp = {
        port_min = 53
        port_max = 53
  }
  remote  = "0.0.0.0/0"
}

#---------------------------------------------------------
# frontend Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "frontend-sg" {
  name = "vpc-pubpriv-frontend-sg"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}
#Inbound
resource "ibm_is_security_group_rule" "frontend-sg-r1" {
  group      = "${ibm_is_security_group.frontend-sg.id}"
  direction  = "inbound"
  icmp = {
        type = 8
        code = 0
  }
  remote  = "0.0.0.0/0"
}
resource "ibm_is_security_group_rule" "frontend-sg-r2" {
  group      = "${ibm_is_security_group.frontend-sg.id}"
  direction  = "inbound"
  tcp = {
        port_min = 22
        port_max = 22
  }
  remote  = "0.0.0.0/0"
}
#Outbound
resource "ibm_is_security_group_rule" "frontend-sg-r3" {
  group      = "${ibm_is_security_group.frontend-sg.id}"
  direction  = "outbound"
  tcp = {
        port_min = 80
        port_max = 80
  }
  remote  = "0.0.0.0/0"
}

#---------------------------------------------------------
# backend Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "backend-sg" {
  name = "vpc-pubpriv-backend-sg"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}
#Inbound
resource "ibm_is_security_group_rule" "backend-sg-r1" {
  group      = "${ibm_is_security_group.backend-sg.id}"
  direction  = "inbound"
  tcp = {
        port_min = 80
        port_max = 80
  }
  remote  = "0.0.0.0/0"
}
