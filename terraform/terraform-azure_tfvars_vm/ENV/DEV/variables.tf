# variable "varenvrg" {
#   type = map(object({
#     rg_name = string
#     rg_loc  = string
#     rg_tag = map(string)
#   }))
# }

# variable "varenvcon" {
#   type = map(object({
#     cont_name = string

#   }))
# }


# variable "varenvrg" {
#   type = map(object({
#     rg_names = string
#     rg_locs  = string
#     rg_tagss = map(string)

#   }))
# }

# variable "varenvsa" {
#   type = map(object({
#     sanames         = string
#     rg_name_key     = string
#     sa_loc_key      = string
#     sa_account_tier = string
#     sa_account_repl = string
#     sa_tagss        = map(string)

#   }))
# }


# variable "varenvcon" {
#   type = map(object({
#     con_name              = string
#     said_key              = string
#     container_access_type = string

#   }))
# }


variable "varenvvn" {
  type = map(object({
    v_name  = string
    add_spa = list(string)
  }))
}

variable "varenvsn" {
  type = map(object({
    snet_name1 = string
    add_prefix = list(string)
    vn_key     = string
  }))
}



variable "varenvnsg" {
  type = map(object({
    nsg_name   = string
    subnet_key = string
    rules = map(object({
      # name=string # as we are taking each.key 
      # in name so it will take the key from tfvars
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


variable "varenvpip" {
  type = map(object({
    pip_name = string
    alo_meth = string
    sku_det  = string
  }))
}

variable "varenvnat" {
  type = map(object({
    nat_name   = string
    sku_det    = string
    pip_key    = string
    subnet_key = string
  }))
}


variable "varenvbas" {
  type = map(object({
    bas_name       = string
    ip_name        = string
    bas_subnet_key = string
    bas_pip_key    = string
  }))
}


variable "varenvnic" {
  type = map(object({
    nic_name       = string
    ip_name        = string
    nic_subnet_key = string
    nic_prip_id    = string
    # nic_pip_key    = string
  }))
}

variable "varenvvm" {
  type = map(object({
    vm_name = string
    vm_size = string
    nic_key = string
    vm_uname   = string
  }))
}