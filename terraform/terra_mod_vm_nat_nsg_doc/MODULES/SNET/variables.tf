variable "varsn" {
    type = object ({
        name = string
        vname = string
        rg_name = string
        add_pre = list(string)
    })
}