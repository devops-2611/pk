variable "varnsg" {
    type = object({
        nsg_name = string
        loc = string
        rg_name = string
        subnet_id   = string
        comm_tags = map(string)
        rules = map(object({
# name= string # as we are taking each.key in 
    #name so it will take the key from tfvars
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string

        }))
    })
}