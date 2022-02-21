# terraform-cloudinit-tor

Generates cloud-init user data for a Tor server (relay or bridge) using the latest stable Debian release. It
*may* also work with Debian derivatives but has not been tested with anything other than Debian. You may want to
check out the [sr2c/torrc](https://registry.terraform.io/modules/sr2c/torrc/) and
[sr2c/contactinfo](https://registry.terraform.io/modules/sr2c/contactinfo) modules for generating
torrc configuration files and
[ContactInfo Information Sharing Specification](https://nusenu.github.io/ContactInfo-Information-Sharing-Specification/)
lines respectively.

The tor package will be installed from the official Tor Project Debian repository at deb.torproject.org. The signing
key for the repository is included in this module.

By default this user data configuration will install the `obfs4proxy` and `nyx` packages. These packages can
be individually disabled using the module inputs. Additional packages may also be installed using the
`additional_packages` input.

The configuration will also change the default congestion control algorithm to BBR as it has been observed to perform
better in many of the scenarios where Tor is used. If this is really a problem then please submit an issue and it
could be made optional.

Example:

```
module "user_data" {
  source = "sr2c/tor/cloudinit"
  torrc  = <<-EOT
  Nickname    TerraformRelay
  ORPort      9001
  ContactInfo email@example.com
  EOT
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | ~> 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | ~> 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudinit_config.this](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_packages"></a> [additional\_packages](#input\_additional\_packages) | A list of additional packages to be installed using apt. | `list(string)` | `[]` | no |
| <a name="input_gzip"></a> [gzip](#input\_gzip) | Compress the final user-data with gzip. | `bool` | `true` | no |
| <a name="input_install_nyx"></a> [install\_nyx](#input\_install\_nyx) | Install the nyx package using apt. | `bool` | `true` | no |
| <a name="input_install_obfs4proxy"></a> [install\_obfs4proxy](#input\_install\_obfs4proxy) | Install the obfs4proxy package using apt. | `bool` | `true` | no |
| <a name="input_torrc"></a> [torrc](#input\_torrc) | The torrc configuration file to be installed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | The final rendered cloud-init user data. |
