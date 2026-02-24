variable "varvm" {
    type = object({
        name = string
        rg_name  = string
        loc = string
        size = string
        uname = string
        pass = string
        nic_id = list(string)
    })
    

}