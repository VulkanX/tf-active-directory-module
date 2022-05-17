data "aws_ami" "dc_ami" {
    most_recent = true
    owners = ["801119661308"] // Amazon

    filter {
        name = "name"
        values = ["*Windows_Server-${local.config_os_ss}-${var.lang}-Full-Base-*"]
    }

    filter {
       name   = "virtualization-type"
       values = ["hvm"]  
    }  
}