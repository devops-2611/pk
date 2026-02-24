varenvrg = {
  dev = {
    rgname = "vishalrg01"
    loc    = "central India"
    tg     = { env = "dev" }
  }

}

varenvvnet = {
  dev = {
    vname = "vishalvn01"
    # rg_key  = "rg1"
    add_spa = ["10.0.0.0/16"]
  }
}


varenvsn = {
  dev = {
    name    = "vishalsn01"
    vn_key  = "dev"
    rg_key  = "dev"
    add_pre = ["10.0.1.0/24"]
  }
  bas = {
    name    = "AzureBastionSubnet"
    vn_key  = "dev"
    rg_key  = "dev"
    add_pre = ["10.0.2.0/24"]
  }
}

varenvpip = {
  nat_pip = {
    pip_name     = "pipnat01"
    pip_all_meth = "Static"
    rg_key       = "dev"
    pip_sku      = "Standard"
  }
  bas_pip = {
    pip_name     = "pipbas01"
    pip_all_meth = "Static"
    rg_key       = "dev"
    pip_sku      = "Standard"
  }
}

varenvnsg = {
  dev_nsg = {
    nsg_name = "vishalnsg01"
    sn_key   = "dev"
    rg_key   = "dev"
    nsg_rule = {
      ssh_rule1 = {
        r_name = "r1_ssh"
        prio   = 100
        dir    = "Inbound"
        acc    = "Allow"
        prot   = "Tcp"
        spr    = "*"
        dpr    = "22"
        sap    = "*"
        dap    = "*"
      }
      http_rule2 = {
        r_name = "r1_http"
        prio   = 110
        dir    = "Inbound"
        acc    = "Allow"
        prot   = "Tcp"
        spr    = "*"
        dpr    = "80"
        sap    = "*"
        dap    = "*"
      }
    }
  }
}

varenvnat = {

  nat_dev = {
    nat_name = "vishalnat01"
    rg_key   = "dev"
    sku      = "Standard"
    pip_key  = "nat_pip"
    sn_key   = "dev"

  }
}

varenvbas = {
  bas1 = {
    bas_name    = "vishalbas01"
    rg_key      = "dev"
    ip_name     = "vishalip01"
    bas_sn_key  = "bas"
    bas_pip_key = "bas_pip"
  }
}

varenvnic = {
  nic1 = {
    nic_name    = "vishalnic01"
    rg_key      = "dev"
    ip_name     = "vishalnicip01"
    nic_sn_key  = "dev"
    nic_prip_id = "Dynamic"
  }
}

varenvvm = {
  vm1 = {
    vm_name = "vishalvm01"
    rg_key  = "dev"
    size    = "Standard_B1s"
    uname   = "welcomeuser"
    pass    = "welcome@123"
    nic_key = "nic1"

  }
}
