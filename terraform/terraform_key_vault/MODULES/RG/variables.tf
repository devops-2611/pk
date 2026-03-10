variable "varrg" {
    type = object({
        name = string
        location = string
        tags = map(string)
    })
}