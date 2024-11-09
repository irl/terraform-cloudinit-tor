variable "additional_packages" {
  default     = []
  description = "A list of additional packages to be installed using apt."
  type        = list(string)
}

variable "gzip" {
  default     = true
  description = "Compress the final user-data with gzip."
  type        = bool
}

variable "install_obfs4proxy" {
  default     = false
  description = "Install the obfs4proxy package using apt."
  type        = bool
}

variable "install_nyx" {
  default     = false
  description = "Install the nyx package using apt."
  type        = bool
}

variable "tailscale_auth_key" {
  type        = string
  description = "The Tailscale auth key used to join the machine to the Tailnet. Leave as null if Tailscale should not be installed."
  nullable    = true
  default     = null

  validation {
    condition     = var.tailscale_auth_key == null || (var.tailscale_auth_key != null && length(var.tailscale_auth_key) >= 20)
    error_message = "The Tailscale auth key must be either null or a valid key of at least 20 characters."
  }
}

variable "tailscale_tags" {
  type        = list(string)
  description = "A list of Tailscale tags to apply to the new server. Each tag must start with 'tag:'."
  nullable    = true
  default     = []

  validation {
    condition     = alltrue([for tag in var.tailscale_tags : startswith(tag, "tag:")])
    error_message = "Each Tailscale tag must start with 'tag:'."
  }
}

variable "torrc" {
  description = "The torrc configuration file to be installed."
  type        = string
}
