variable "varenvrg" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "varenvkv" {
  type = map(object({
    name   = string
    rg-key = string
  }))
}