# module "name_mod" {
#   source = "../../MODULES/NAMING"
# }

# module "rg_mod" {
#   source = "../../MODULES/RG"
#   varrg = {
#     rg_name = module.name_mod.name_out.rg_name
#     rg_loc  = module.name_mod.name_out.rg_loc
#     rg_tags = module.name_mod.name_out.rg_tag
#   }
# }

# module "sa_mod" {
#   source = "../../MODULES/SA"
#   varsa = {
#     sa_name             = module.name_mod.name_out.sa_name
#     rg_name             = module.rg_mod.rg_out.rg_name
#     sa_loc              = module.name_mod.name_out.sa_loc
#     account_tier        = module.name_mod.name_out.sa_account_tier
#     account_replication = module.name_mod.name_out.sa_account_replication_type
#     tags                = module.name_mod.name_out.sa_tag
#   }

# }

# module "con_mod" {
#   source   = "../../MODULES/CON"
#   for_each = var.varenvcon
#   varcon = {
#     con_name              = each.value.cont_name
#     sa_id                 = module.sa_mod.sa_det.sa_id
#     container_access_type = module.name_mod.name_out.con_atp


#   }
# }


# module "rg_mod" {
#   source   = "../../MODULES/RG"
#   for_each = var.varenvrg
#   varrg = {
#     rg_name = each.value.rg_names
#     rg_loc  = each.value.rg_locs
#     rg_tags = each.value.rg_tagss
#   }
# }


# module "sa_mod" {
#   source   = "../../MODULES/SA"
#   for_each = var.varenvsa
#   varsa = {
#     sa_name             = each.value.sanames
#     rg_name             = module.rg_mod[each.value.rg_name_key].rg_det.rg_name
#     sa_loc              = module.rg_mod[each.value.rg_name_key].rg_det.rg_location
#     account_tier        = each.value.sa_account_tier
#     account_replication = each.value.sa_account_repl
#     tags                = each.value.sa_tagss
#   }

# }


# module "con_mod" {
#   source   = "../../MODULES/CON"
#   for_each = var.varenvcon
#   varcon = {
#     con_name              = each.value.con_name
#     sa_id                 = module.sa_mod[each.value.said_key].sa_det.sa_id
#     container_access_type = each.value.container_access_type


#   }
# }


module "namings" {
  source = "../../MODULES/NAMING"
}

module "rg_mod" {
  source = "../../MODULES/RG"
  varrg = {
    rg_name     = module.namings.name_out.rg_name
    common_loc  = module.namings.name_out.rg_loc
    common_tags = module.namings.name_out.rg_tags
  }
}


module "vn_mod" {
  source   = "../../MODULES/VNET"
  for_each = var.varenvvn
  varvn = {
    vnet_name   = each.value.v_name
    add_spa     = each.value.add_spa
    rg_name     = module.rg_mod.rg_details.rg_name_out
    loc         = module.rg_mod.rg_details.comm_loc
    common_tags = module.rg_mod.rg_details.comm_tag
  }
}


module "sn_mod" {
  source   = "../../MODULES/SNET"
  for_each = var.varenvsn
  varsn = {
    snet_name = each.value.snet_name1
    rg_name   = module.rg_mod.rg_details.rg_name_out
    # vnet_name = module.vn_mod.vn_det.vn_name
    vnet_name = module.vn_mod[each.value.vn_key].vn_det.vn_name
    add_prefi = each.value.add_prefix
  }
}



module "nsg_mod" {
  source   = "../../MODULES/NSG"
  for_each = var.varenvnsg
  varnsg = {
    nsg_name  = each.value.nsg_name
    loc       = module.rg_mod.rg_details.comm_loc
    rg_name   = module.rg_mod.rg_details.rg_name_out
    subnet_id = module.sn_mod[each.value.subnet_key].snet_det.snet_id
    comm_tags = module.rg_mod.rg_details.comm_tag
    rules     = each.value.rules

  }
}


module "pip_mod" {
  source   = "../../MODULES/PIP"
  for_each = var.varenvpip
  varpip = {
    name              = each.value.pip_name
    location          = module.rg_mod.rg_details.comm_loc
    rg_name           = module.rg_mod.rg_details.rg_name_out
    allocation_method = each.value.alo_meth
    sku               = each.value.sku_det
  }
}


module "nat_mod" {
  source   = "../../MODULES/NAT"
  for_each = var.varenvnat
  varnat = {
    name     = each.value.nat_name
    location = module.rg_mod.rg_details.comm_loc
    rg_name  = module.rg_mod.rg_details.rg_name_out
    sku      = each.value.sku_det
    pipid    = module.pip_mod[each.value.pip_key].pip_det.pip_id
    snet_id  = module.sn_mod[each.value.subnet_key].snet_det.snet_id

  }
}



module "bas_mod" {
  source   = "../../MODULES/BAS"
  for_each = var.varenvbas
  varbas = {
    bas_name    = each.value.bas_name
    bas_loc     = module.rg_mod.rg_details.comm_loc
    rg_name     = module.rg_mod.rg_details.rg_name_out
    ip_name     = each.value.ip_name
    bas_snet_id = module.sn_mod[each.value.bas_subnet_key].snet_det.snet_id
    bas_pip_id  = module.pip_mod[each.value.bas_pip_key].pip_det.pip_id

  }
}

module "nic_mod" {
  source   = "../../MODULES/NIC"
  for_each = var.varenvnic
  varnic = {
    nic_name    = each.value.nic_name
    nic_loc     = module.rg_mod.rg_details.comm_loc
    rg_name     = module.rg_mod.rg_details.rg_name_out
    ip_name     = each.value.ip_name
    nic_snet_id = module.sn_mod[each.value.nic_subnet_key].snet_det.snet_id
    nic_prip_id = each.value.nic_prip_id
    # nic_pip_id  = module.pip_mod[each.value.nic_pip_key].pip_det.pip_id

  }
}


module "vm_mod" {
  source   = "../../MODULES/VM"
  for_each = var.varenvvm
  varvm = {
    vm_name = each.value.vm_name
    loc     = module.rg_mod.rg_details.comm_loc
    rg_name = module.rg_mod.rg_details.rg_name_out
    vm_size = each.value.vm_size
    nic_id  = [module.nic_mod[each.value.nic_key].nic_det.nic_id]
    uname   = each.value.vm_uname
    # pub_key = each.value.pub_key
  }
}