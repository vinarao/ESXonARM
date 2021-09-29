/*
*  calling the different modules from this main file
*/

module "vcn" {
  source = "./modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_id}"
  availability_domain = "${var.availability_domain}"
}

module "compute"{
    source = "./modules/compute"
    tenancy_ocid = "${var.tenancy_ocid}"
    compartment_ocid = "${var.compartment_id}"
    availability_domain = "${var.availability_domain}"
    image_ocid = "${var.image_ocid}"
    instance_shape = "${var.instance_shape}"
    ssh_public_key = "${var.ssh_public_key}"
    subnet1_ocid = "${module.vcn.subnet1_ocid}"
    subnet2_ocid = "${module.vcn.subnet2_ocid}"
}

