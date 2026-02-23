variable "varpip" {
    type = object({
        name = string
        location = string
        rg_name = string
        allocation_method = string
        sku = string
    })
}