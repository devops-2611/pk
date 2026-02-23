variable "varvm" {
    type = object({
        vm_name = string
        loc = string
        rg_name = string
        vm_size = string
        nic_id = list(string)
        uname = string
        # pub_key = string
        # caching = string
        # sto_atype = string
        # publisher = string
        # offer = string
        # sku = string
        # version = string
    })
}