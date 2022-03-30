variable "folder_name" {}
variable "deploy_vsphere_datacenter" {}

variable "parent_path" {
  type                            = string
  default                         = ""
}

variable "tags" {
  type                            = list
  default                         = []
}


data "vsphere_datacenter" "target_dc" {
  name                            = var.deploy_vsphere_datacenter
}


resource "vsphere_folder" "folder" {
  path                            = "${var.parent_path}/${var.folder_name}"
  type                            = "vm"
  datacenter_id                   = data.vsphere_datacenter.target_dc.id
  tags                            = var.tags
}


output "vsphere_folder_id" {
  value                           = vsphere_folder.folder.id
}

output "vsphere_folder_path" {
  value                           = "${var.parent_path}/${var.folder_name}"
}
