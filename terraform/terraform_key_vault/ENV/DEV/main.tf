module "rg-mod" {
  source   = "../../MODULES/RG"
  for_each = var.varenvrg
  varrg = {
    name     = each.value.name
    location = each.value.location
    tags     = each.value.tags

  }
}

module "kv-mod" {
  source   = "../../MODULES/KV"
  for_each = var.varenvkv
  varkv = {
    name     = each.value.name
    location = module.rg-mod[each.value.rg-key].rg-det.com_loc
    rg-name  = module.rg-mod[each.value.rg-key].rg-det.rg_name

  }
}