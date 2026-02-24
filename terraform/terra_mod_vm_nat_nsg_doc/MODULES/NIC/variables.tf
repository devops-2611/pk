variable "varnic" {
    type = object ({
        name = string
        loc = string
        rg_name = string
        ip_name = string
        nic_snet_id = string
        nic_prip_id = string
    })
}