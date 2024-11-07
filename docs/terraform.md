<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | >= 2.2.0 |

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
| <a name="input_install_nyx"></a> [install\_nyx](#input\_install\_nyx) | Install the nyx package using apt. | `bool` | `false` | no |
| <a name="input_install_obfs4proxy"></a> [install\_obfs4proxy](#input\_install\_obfs4proxy) | Install the obfs4proxy package using apt. | `bool` | `false` | no |
| <a name="input_tailscale_auth_key"></a> [tailscale\_auth\_key](#input\_tailscale\_auth\_key) | The Tailscale auth key used to join the machine to the Tailnet. Leave as null if Tailscale should not be installed. | `string` | `null` | no |
| <a name="input_tailscale_tags"></a> [tailscale\_tags](#input\_tailscale\_tags) | A list of Tailscale tags to apply to the new server. Each tag must start with 'tag:'. | `list(string)` | `[]` | no |
| <a name="input_torrc"></a> [torrc](#input\_torrc) | The torrc configuration file to be installed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | The final rendered cloud-init user data. |
<!-- markdownlint-restore -->
