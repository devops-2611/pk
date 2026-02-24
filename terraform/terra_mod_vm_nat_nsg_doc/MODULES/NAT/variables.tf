variable "varnat" {
    type = object({
        name = string
        loc = string
        rg_name = string
        sku = string
        pipid = string
        snet_id = string
    })
}