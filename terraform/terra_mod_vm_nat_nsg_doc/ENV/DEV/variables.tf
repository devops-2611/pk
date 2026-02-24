variable "varenvrg" {
  type = map(object({
    rgname = string
    loc    = string
    tg     = map(string)
  }))
}

variable "varenvvnet" {
  type = map(object({
    vname = string
    # rg_key  = string
    add_spa = list(string)
  }))
}

variable "varenvsn" {
  type = map(object({
    name    = string
    vn_key  = string
    rg_key  = string
    add_pre = list(string)
  }))
}


variable "varenvpip" {
  type = map(object({
    pip_name     = string
    pip_all_meth = string
    rg_key       = string
    pip_sku      = string
  }))
}

variable "varenvnsg" {
  type = map(object({
    nsg_name = string
    rg_key   = string
    sn_key   = string
    nsg_rule = map(object({
      r_name = string
      prio   = number
      dir    = string
      acc    = string
      prot   = string
      spr    = string
      dpr    = string
      sap    = string
      dap    = string
    }))
    })
  )
}


variable "varenvnat" {
  type = map(object({
    nat_name = string
    rg_key   = string
    sku      = string
    pip_key  = string
    sn_key   = string

  }))
}

variable "varenvbas" {
  type = map(object({
    bas_name    = string
    rg_key      = string
    ip_name     = string
    bas_sn_key  = string
    bas_pip_key = string
  }))
}

variable "varenvnic" {
  type = map(object({
    nic_name    = string
    rg_key      = string
    ip_name     = string
    nic_sn_key  = string
    nic_prip_id = string
  }))
}

variable "varenvvm" {
  type = map(object({
    vm_name = string
    rg_key  = string
    size    = string
    uname   = string
    pass    = string
    nic_key = string
  }))
}