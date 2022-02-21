locals {
  packages = compact(flatten([
    "tor",
    "tor-geoipdb",
    "deb.torproject.org-keyring",
    var.install_obfs4proxy ? "obfs4proxy" : "",
    var.install_nyx        ? "nyx" : "",
    var.additional_packages
  ]))
  tor_apt_key = file("${path.module}/data/tor_apt_key.asc")
}

data "cloudinit_config" "this" {
  gzip = var.gzip

  part {
    content = templatefile("${path.module}/templates/user_data.yaml", {
      packages = jsonencode(local.packages)
      tor_apt_key = jsonencode(local.tor_apt_key)
      torrc = jsonencode(var.torrc)
    })
    content_type = "text/cloud-config"
    filename = "user_data.yaml"
  }
}