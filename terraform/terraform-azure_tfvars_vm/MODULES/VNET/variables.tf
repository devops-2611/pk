variable "varvn" {
    type = object({
        vnet_name = string
        add_spa = list(string)
        loc = string
        rg_name = string
        common_tags = map(string)
    })
}