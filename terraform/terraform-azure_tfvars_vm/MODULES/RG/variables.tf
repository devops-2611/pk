variable "varrg" {
    type = object({
        rg_name = string
        common_loc = string
        common_tags = map(string)
    })
}