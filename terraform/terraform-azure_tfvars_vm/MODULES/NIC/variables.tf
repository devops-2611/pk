variable "varnic" {
    type = object({
        nic_name = string
        nic_loc = string
        rg_name = string
        ip_name = string
        nic_snet_id = string
        nic_prip_id = string
        # nic_pip_id = string
    })
}