resource "tls_private_key" "ssh_key" {
  algorithm = "ED25519"
}

resource "hcloud_ssh_key" "this" {
  name       = local.ssh_key_name
  public_key = tls_private_key.ssh_key.public_key_openssh

  labels = {
    cluster = var.cluster_name
  }
}
