variable "additional_packages" {
  default = []
  description = "A list of additional packages to be installed using apt."
  type = list(string)
}

variable "gzip" {
  default = true
  description = "Compress the final user-data with gzip."
  type = bool
}

variable "install_obfs4proxy" {
  default = true
  description = "Install the obfs4proxy package using apt."
  type = bool
}

variable "install_nyx" {
  default = true
  description = "Install the nyx package using apt."
  type = bool
}

variable "torrc" {
  description = "The torrc configuration file to be installed."
  type = string
}
