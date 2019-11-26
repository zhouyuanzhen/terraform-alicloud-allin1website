/* Print the public ip address for our new provisioned instance */
output "ac_demo_public_ip" {
  value = alicloud_instance.ecs_ac_demo.public_ip
}
