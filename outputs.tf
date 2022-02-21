output "rendered" {
  description = "The final rendered cloud-init user data."
  value = data.cloudinit_config.this.rendered
}