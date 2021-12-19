locals {
  ssh_private_key   = file("~/.ssh/id_do_cks")
}

inputs = {
  vpc_ip_range = "10.20.30.0/24"
  region       = "tor1"

  controllers = {
    controller-1 = {
      ssh_private_key = local.ssh_private_key
      size   = "s-1vcpu-2gb"
    }
  }

  nodes = {
    node-1 = {
      ssh_private_key = local.ssh_private_key
      size   = "s-1vcpu-2gb"
    }
  }

  droplet_ssh_keys = {
    "Workstation" = local.ssh_private_key
  }
}

terraform {
  source = "git::git@github.com:supertylerc/cks-do-terraform.git//"

  before_hook "create_default_vpc" {
    commands     = ["apply"]
    execute = [
      "/bin/bash",
      "${get_parent_terragrunt_dir()}/../create_dummy_vpc.sh",
      "tor1",
      "192.168.1.0/24" 
    ]
  }
}
