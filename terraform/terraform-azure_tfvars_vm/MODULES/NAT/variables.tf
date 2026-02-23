variable "varnat" {
    type = object({
        name = string
        location = string
        rg_name = string
        sku = string
        pipid = string
        snet_id = string
    })
}