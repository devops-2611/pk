variable "varbas" {
    type = object({
        name = string
        loc = string
        rg_name = string
        ip_name = string
        bas_snet_id = string
        bas_pip_id = string
    })
}