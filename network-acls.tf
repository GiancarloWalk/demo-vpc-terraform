/*
resource "ibm_is_network_acl" "default_acl" {
  name = "${var.vpc-name}-default-acl"

  rules = [
    {
      name        = "${var.vpc-name}-default-deny-all-ingress"
      action      = "deny"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "inbound"
    },
    {
      name        = "${var.vpc-name}-default-deny-all-egress"
      action      = "deny"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "outbound"
    },
  ]
}
*/