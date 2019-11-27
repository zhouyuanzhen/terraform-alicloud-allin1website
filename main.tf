/* Config AliCloud Terraform Provider */
provider "alicloud" {
  profile = var.alicloud_profile
  region = var.alicloud_region
}


/* Part: VPC */
resource "alicloud_vpc" "vpc_ac_demo" {

  name       = "vpc_mc_alicloud_demo1"
  cidr_block = var.vpc-cidr
  description = "AliCloud allin1website VPC by Terraform"

}

resource "alicloud_vswitch" "vsw_ac_demo" {

  vpc_id            = alicloud_vpc.vpc_ac_demo.id
  cidr_block        = var.vsw-cidr
  availability_zone = var.alicloud_az

}
// End: VPC //


/* Part: Security Group */
resource "alicloud_security_group" "sg_ac_demo" {

  name        = "sg_ecs_default_tf"
  vpc_id      = alicloud_vpc.vpc_ac_demo.id
  description = "AliCloud allin1website Security Groups by Terraform"

}

resource "alicloud_security_group_rule" "sg_allow_ssh" {

  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.sg_ac_demo.id
  cidr_ip           = "0.0.0.0/0"

}

resource "alicloud_security_group_rule" "sg_allow_http" {

  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.sg_ac_demo.id
  cidr_ip           = "0.0.0.0/0"

}
// End: Security Group //


/* Part: AliCloud ECS */
# Create an ecs instance
data "alicloud_images" "images_centos7" {
  name_regex = "^centos_7_7_64_20G_alibase_2019"
}

## User-Data for Cloud-Init
data "template_file" "cloud_init_ac_demo" {
  template = file(var.template_file)
  vars = {
    INDEX_CONTENT = var.demo_html_content
    SSH_AUTH_KEYS = var.ssh_auth_keys
  }
}

resource "alicloud_instance" "ecs_ac_demo" {

  instance_charge_type = "PostPaid"
  internet_charge_type = "PayByTraffic"

  availability_zone    = var.alicloud_az
  security_groups      = [alicloud_security_group.sg_ac_demo.id]

  image_id             = data.alicloud_images.images_centos7.images[0].id
  instance_type        = var.ecs-type
  instance_name        = var.ecs-name
  vswitch_id           = alicloud_vswitch.vsw_ac_demo.id
  internet_max_bandwidth_out = var.max-internet-bandwidth

  host_name            = var.ecs-hostname

  system_disk_category = "cloud_efficiency"
  system_disk_size     = var.ecs-disk-size

  user_data = data.template_file.cloud_init_ac_demo.rendered

  tags                       = {
    "Purpose"   = "Terraform Allin1 WebSite Module Demo"
    "Auther" = "Zhou Yuanzhen <szrednick@gmail.com>"
  }

}
// End: ECS //

# Create a demo DNS record
resource "alicloud_dns_record" "dns_record_ac_demo" {

  name        = var.demo_domain_name
  host_record = var.demo_dns_record
  type        = "A"
  value       = alicloud_instance.ecs_ac_demo.public_ip

}
