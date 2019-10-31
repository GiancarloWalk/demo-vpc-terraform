###########################################
# Developer access group and access policies
############################################

#Creación del grupo de accesos
resource "ibm_iam_access_group" "vpc_ag_devs" {
  name        = "${ibm_is_vpc.vpc1.name}-devs"
  description = "Grupo de accesos para desarrolladores en la vpc -${ibm_is_vpc.vpc1.name}"
}

#Access to resource group 
resource "ibm_iam_access_group_policy" "vpc_ag_devs_p1" {
  access_group_id = "${ibm_iam_access_group.vpc_ag_devs.id}"
  roles           = ["Operator"]

  resources = [{
    resource_type = "resource-group"
    resource      = "${data.ibm_resource_group.resource_group.id}"
  }]
}

#Agregar usuarios
resource "ibm_iam_access_group_members" "devs" {
  access_group_id = "${ibm_iam_access_group.vpc_ag_devs.id}"
  ibm_ids         = "${var.iam_access_devs_members}"
}

###########################################
# Testers access group and access policies
############################################

#Creación del grupo de accesos
resource "ibm_iam_access_group" "vpc_ag_testers" {
  name        = "${ibm_is_vpc.vpc1.name}-testers"
  description = "Grupo de accesos para testers en la vpc -${ibm_is_vpc.vpc1.name}"
}

#Access to resource group 
resource "ibm_iam_access_group_policy" "vpc_ag_testers_p1" {
  access_group_id = "${ibm_iam_access_group.vpc_ag_testers.id}"
  roles           = ["Viewer"]

  resources = [{
    resource_type = "resource-group"
    resource      = "${data.ibm_resource_group.resource_group.id}"
  }]
}

#Agregar usuarios
resource "ibm_iam_access_group_members" "testers" {
  access_group_id = "${ibm_iam_access_group.vpc_ag_testers.id}"
  ibm_ids         = "${var.iam_access_testers_members}"
}