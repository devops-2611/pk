variable "varcon" {
    type = object({
        con_name = string
        sa_id  = string
        container_access_type = string
    })
}