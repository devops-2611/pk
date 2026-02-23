# varenvrg = {
#   rg1 = {
#     rg_name_mod = "vishal_rg1"
#     rg_loc_mod  = "Central India"
#     rg_tags_mod = { env = "dev" }
#   }
# }

# varenvcon = {
#   cont1 = {
#     cont_name = "vishalcont1"
#   }
#   cont2 = {
#     cont_name = "vishalcont2"
#   }

# }

# varenvrg = {
#   rg1 = {
#     rg_names = "vishalrg01"
#     rg_locs  = "Central India"
#     rg_tagss = { env = "dev" }
#   }
#   rg2 = {
#     rg_names = "vishalrg02"
#     rg_locs  = "Central India"
#     rg_tagss = { env = "dev" }
#   }
# }

# varenvsa = {
#   sa1 = {
#     sanames         = "vishalrgsa03"
#     rg_name_key     = "rg1"
#     sa_loc_key      = "rg1"
#     sa_account_tier = "Standard"
#     sa_account_repl = "LRS"
#     sa_tagss        = { env = "dev" }
#   }

#   sa2 = {
#     sanames         = "vishalrgsa04"
#     rg_name_key     = "rg2"
#     sa_loc_key      = "rg2"
#     sa_account_tier = "Standard"
#     sa_account_repl = "LRS"
#     sa_tagss        = { env = "prod" }
#   }

# }

# varenvcon = {
#   con1 = {
#     con_name              = "vonshalcon1"
#     said_key              = "sa1"
#     container_access_type = "container"
#   }
#   con2 = {
#     con_name              = "vonshalcon2"
#     said_key              = "sa1"
#     container_access_type = "container"
#   }


#   con3 = {
#     con_name              = "vonshalcon1"
#     said_key              = "sa2"
#     container_access_type = "container"
#   }
#   con4 = {
#     con_name              = "vonshalcon2"
#     said_key              = "sa2"
#     container_access_type = "container"
#   }
# }

varenvvn = {
  vn1 = {
    v_name  = "vishalvn01"
    add_spa = ["10.0.0.0/16"]
  }
}

varenvsn = {
  sn1 = {
    snet_name1 = "vishalsn1"
    add_prefix = ["10.0.1.0/24"]
    vn_key     = "vn1"
  }
  sn2_bastion = {
    snet_name1 = "AzureBastionSubnet"
    add_prefix = ["10.0.2.0/27"]
    vn_key     = "vn1"
  }

}

varenvnsg = {
  nsg1 = {
    nsg_name   = "vishalnsg01"
    subnet_key = "sn1"
    rules = {
      rule1_allow_ssh = {
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      rule2_allow_http = {
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }


    }
  }
}

varenvpip = {
  pip1 = {
    pip_name = "vishalpi01"
    alo_meth = "Static"
    sku_det  = "Standard"
  }
  pip2_bastion = {
    pip_name = "vishalpi02"
    alo_meth = "Static"
    sku_det  = "Standard"
  }

}


varenvnat = {
  nat1 = {
    nat_name   = "vishalnat01"
    sku_det    = "Standard"
    pip_key    = "pip1"
    subnet_key = "sn1"
  }
}


varenvbas = {
  bas1 = {
    bas_name       = "vishalbas01"
    ip_name        = "Standard"
    bas_subnet_key = "sn2_bastion"
    bas_pip_key    = "pip2_bastion"
  }
}


varenvnic = {
  nic1 = {
    nic_name       = "vishalnic01"
    ip_name        = "Standard"
    nic_subnet_key = "sn1"
    nic_prip_id    = "Dynamic"
  }
}

varenvvm = {
  vm1 = {
    vm_name = "vishalvm1"
    vm_size = "Standard_B1s"
    nic_key = "nic1"
    vm_uname   = "welcomeuser"
  }

}