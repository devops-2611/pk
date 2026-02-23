
output "name_out" {
    value = {
        rg_loc = local.loc
        rg_name = local.rg_name
        rg_tags = local.rg_tags
        }
    }