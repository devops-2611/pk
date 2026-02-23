variable "varsa"{
    type = object({
        sa_name = string
        rg_name  = string
        sa_loc = string
        account_tier = string
        account_replication = string
        tags = map(string)

    })
}