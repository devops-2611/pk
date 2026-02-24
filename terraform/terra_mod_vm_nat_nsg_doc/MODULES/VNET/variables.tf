variable "varvnet" {
    type = object({
        name = string
        rg_name = string
        add_spa = list(string)
        loc = string
        tg = map(string)
    })
}