variable "varnsg" {
    type = object({
        nsg_name = string
        loc = string
        rg_name = string
        tgs = map(string)
        snet_id = string
        rules = map(object({
            r_name = string
            prio = number
            dir = string
            acc = string
            prot = string
            spr = string
            dpr = string
            sap = string
            dap = string

        }))
    })
}