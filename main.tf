resource "aws_instance" "root_pdc_1" {
    ami = data.aws_ami.dc_ami.id
    instance_type = "t3.micro"

    key_name = "kp-windows-general"

    iam_instance_profile = aws_iam_instance_profile.ec2_ad_forest_role.name

    root_block_device {
        volume_type = "gp3"
        volume_size = 30
    }

    network_interface {
      network_interface_id = aws_network_interface.root_pdc_nic.id
      device_index = 0
    }

    tags = {
        Name = "Root PDC"
    }
}

resource "aws_instance" "root_sdc_1" {
    ami = data.aws_ami.dc_ami.id
    instance_type = "t3.micro"

    key_name = "kp-windows-general"

    iam_instance_profile = aws_iam_instance_profile.ec2_ad_forest_role.name

    root_block_device {
        volume_type = "gp3"
        volume_size = 30
    }

    network_interface {
        network_interface_id = aws_network_interface.root_sdc_nic.id
        device_index = 0
    }

    tags = {
        Name = "Root SDC"
    }
}

resource "aws_network_interface" "root_sdc_nic" {
    subnet_id = var.subnet_id
    private_ip = var.root_sdc_private_ip
}

resource "aws_network_interface" "root_pdc_nic" {
    subnet_id = var.subnet_id
    private_ip = var.root_pdc_private_ip
}