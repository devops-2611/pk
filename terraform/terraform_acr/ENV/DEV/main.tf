module "rg_mod" {
  source   = "../../MODULES/RG"
  for_each = var.varenvrg
  varrg = {
    name     = each.value.name
    location = each.value.location
    tags     = each.value.tags
  }
}

# module "acr_mod" {
#   source   = "../../MODULES/ACR"
#   for_each = var.varenvacr
#   varacr = {
#     name     = each.value.name
#     location = each.value.location
#     tags     = each.value.tags
#   }
# }