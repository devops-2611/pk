variable "varsn" {
    type = object ({
        snet_name = string
        rg_name = string
        vnet_name = string
        add_prefi = list(string)
    })
}