variable "varpip" {
    type = object ({
        name = string
        loc = string
        rg_name = string
        all_meth = string
        sku = string
    })
}