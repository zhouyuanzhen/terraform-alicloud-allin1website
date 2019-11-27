variable "alicloud_region" {
  default = "cn-hangzhou"
}

variable "alicloud_az" {
  default = "cn-hangzhou-i"
}

variable "alicloud_profile" {
  default = "default"
}

variable "alicloud_centos7_img" {
  default = "centos_7_7_64_20G_alibase_20191008.vhd"
}

variable "ecs-type" {
  default = "ecs.t6-c4m1.large"
}

variable "ecs-name" {
  default = "ecs_ac_demo"
}

variable "ecs-disk-size" {
  default = "20"
}

variable "ecs-hostname" {
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

}

variable "template_file" {

}

variable "demo_html_content" {
  default = "<h1>My Demo Site</h1><br>Hello world, 2019!"
}

variable "demo_domain_name" {}

variable "demo_dns_record" {
  default = "demo"
}
