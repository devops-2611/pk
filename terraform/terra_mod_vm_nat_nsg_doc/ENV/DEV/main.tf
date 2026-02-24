module "rg_mod" {
  source   = "../../MODULES/RG"
  for_each = var.varenvrg
  varrg = {
    rg_name  = each.value.rgname
    location = each.value.loc
    tags     = each.value.tg
  }
}

module "vnet_mod" {
  source   = "../../MODULES/VNET"
  for_each = var.varenvvnet
  varvnet = {
    name    = each.value.vname
    rg_name = module.rg_mod[each.key].rg_det.rg_name
    # rg_name = module.rg_mod[each.value.rg_key].rg_det.rg_name
    add_spa = each.value.add_spa
    loc     = module.rg_mod[each.key].rg_det.comm_loc
    tg      = module.rg_mod[each.key].rg_det.comm_tag
    # loc     = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    # tg      = module.rg_mod[each.value.rg_key].rg_det.comm_tag
  }
}

module "sn_mod" {
  source   = "../../MODULES/SNET"
  for_each = var.varenvsn
  varsn = {
    name    = each.value.name
    vname   = module.vnet_mod[each.value.vn_key].vnet_det.vnet_name
    rg_name = module.rg_mod[each.value.rg_key].rg_det.rg_name
    add_pre = each.value.add_pre
  }
}

module "pip_mod" {
  source   = "../../MODULES/PIP"
  for_each = var.varenvpip
  varpip = {
    name     = each.value.pip_name
    loc      = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    rg_name  = module.rg_mod[each.value.rg_key].rg_det.rg_name
    all_meth = each.value.pip_all_meth
    sku      = each.value.pip_sku
  }
}

module "nsg_mod" {
  source   = "../../MODULES/NSG"
  for_each = var.varenvnsg
  varnsg = {
    nsg_name = each.value.nsg_name
    loc      = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    rg_name  = module.rg_mod[each.value.rg_key].rg_det.rg_name
    tgs      = module.rg_mod[each.value.rg_key].rg_det.comm_tag
    snet_id  = module.sn_mod[each.value.sn_key].sn_det.sn_id
    rules    = each.value.nsg_rule

  }
}


module "nat_mod" {
  source   = "../../MODULES/NAT"
  for_each = var.varenvnat
  varnat = {
    name    = each.value.nat_name
    loc     = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    rg_name = module.rg_mod[each.value.rg_key].rg_det.rg_name
    sku     = each.value.sku
    pipid   = module.pip_mod[each.value.pip_key].pip_det.pip_id
    snet_id = module.sn_mod[each.value.sn_key].sn_det.sn_id
  }
}

module "bas_mod" {
  source   = "../../MODULES/BAS"
  for_each = var.varenvbas
  varbas = {
    name        = each.value.bas_name
    loc         = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    rg_name     = module.rg_mod[each.value.rg_key].rg_det.rg_name
    ip_name     = each.value.ip_name
    bas_snet_id = module.sn_mod[each.value.bas_sn_key].sn_det.sn_id
    bas_pip_id  = module.pip_mod[each.value.bas_pip_key].pip_det.pip_id
  }
}


module "nic_mod" {
  source   = "../../MODULES/NIC"
  for_each = var.varenvnic
  varnic = {
    name        = each.value.nic_name
    loc         = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    rg_name     = module.rg_mod[each.value.rg_key].rg_det.rg_name
    ip_name     = each.value.ip_name
    nic_snet_id = module.sn_mod[each.value.nic_sn_key].sn_det.sn_id
    nic_prip_id = each.value.nic_prip_id
  }
}


module "vm_mod" {
  source   = "../../MODULES/VM"
  for_each = var.varenvvm
  varvm = {
    name    = each.value.vm_name
    rg_name = module.rg_mod[each.value.rg_key].rg_det.rg_name
    loc     = module.rg_mod[each.value.rg_key].rg_det.comm_loc
    size    = each.value.size
    uname   = each.value.uname
    pass    = each.value.pass
    nic_id  = [module.nic_mod[each.value.nic_key].nic_det.nic_id]

  }
}