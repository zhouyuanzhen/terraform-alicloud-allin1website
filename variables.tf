variable "alicloud_region" {
  description = "AliCloud region used for this project"
  default = "cn-hangzhou"
}

variable "alicloud_az" {
  description = "AliCloud AZ used for this project"
  default = "cn-hangzhou-i"
}

variable "alicloud_profile" {
  description = "Your AliCloud Client profile name for orchestrator the AliCloud resources"
  default = "default"
}

variable "alicloud_centos7_img" {
  description = "OS image used for your ecs instance"
  default = "centos_7_7_64_20G_alibase_20191008.vhd"
}

variable "ecs-type" {
  description = "Your ecs instance type"
  default = "ecs.t6-c4m1.large"
}

variable "ecs-name" {
  description = "Your ecs instance name"
  default = "ecs_ac_demo"
}

variable "ecs-disk-size" {
  description = "Your ecs system disk size(GB)"
  default = "20"
}

variable "ecs-hostname" {
  description = "Your ecs hostname"
  default = "terraform-demo"
}

variable "vpc-cidr" {
  default = "192.168.0.0/16"
}

variable "vsw-cidr" {
  default = "192.168.8.0/24"
}

variable "max-internet-bandwidth" {
  default = 1
}

variable "ssh_auth_keys" {
  description = "Your ssh public key used to inject to the ecs instance"
}

variable "template_file" {
  description = "Cloud-Init template file"
}

variable "demo_html_content" {
  description = "Your website index page content"
  default = "<h1>My Demo Site</h1><br>Hello world, 2019!"
}

variable "demo_domain_name" {}

variable "demo_dns_record" {
  description = "Your website dns record prefix"
  default = "demo"
}
