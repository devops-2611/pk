variable "varrg" {
    type = object({
        rg_name = string
        location = string
        tags = map(string)
    })
}