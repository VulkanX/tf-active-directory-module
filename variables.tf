variable os {
    type = string
    default = "2019"
}

variable lang {
    type = string
    default = "English"
}

variable root_pdc_private_ip {
    type = string
    description = "Primary DC Private IP"
}

variable root_sdc_private_ip {
    type = string
    description = "Secondary DC Private IP"
}

variable subnet_id {
    type = string
}

variable module_config {
    type = map(any)
    default = {
        "2022" = {
            ami_ss = "2022"
        },
        "2019" = {
            ami_ss = "2019"
        },
        "2016" = {
            ami_ss = "2016"
        },
        "2012" = {
            ami_ss = "2012_RTM"
        },
        "2012R2" = {
            ami_ss = "2012_R2_RTM"
        }
    }
}