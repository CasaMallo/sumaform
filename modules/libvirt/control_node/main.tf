module "control_node" {
  source = "../host"
  base_configuration = "${var.base_configuration}"
  name = "${var.name}"
  image = "sles12sp1"
  running = "${var.running}"
  mac = "${var.mac}"
  grains = <<EOF

package-mirror: ${var.base_configuration["package_mirror"]}
server: ${var.server_configuration["hostname"]}
client: ${var.client_configuration["hostname"]}
minion: ${var.minion_configuration["hostname"]}
role: control-node

EOF
}
