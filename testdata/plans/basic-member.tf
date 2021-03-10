provider "zerotier" {}

resource "zerotier_identity" "alice" {}
resource "zerotier_network" "alicenet" {
  name = "alicenet"
  assignment_pool {
    cidr = "10.0.0.0/24"
  }
}

resource "zerotier_member" "alice" {
  name                    = "alice"
  member_id               = zerotier_identity.alice.id
  network_id              = zerotier_network.alicenet.id
  description             = "Hello, world"
  hidden                  = true
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.0.0.1"]
  capabilities            = [1, 2, 3]
}
