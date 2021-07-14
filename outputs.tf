// Output VPC
output "vpc_id" {
  description = "The ID of the VPC."
  value       = alicloud_cs_kubernetes.k8s[0].vpc_id
}

output "vswitch_ids" {
  description = "List ID of the VSwitches."
  value       = [alicloud_cs_kubernetes.k8s.*.vswitch_ids]
}

output "nat_gateway_id" {
  value = alicloud_cs_kubernetes.k8s[0].nat_gateway_id
}

// Output kubernetes resource
output "cluster_id" {
  description = "ID of the kunernetes cluster."
  value       = alicloud_cs_kubernetes.k8s.*.id
}

output "security_group_id" {
  description = "ID of the Security Group used to deploy kubernetes cluster."
  value       = alicloud_cs_kubernetes.k8s[0].security_group_id
}

output "cluster_nodes" {
  description = "List nodes of cluster."
  value       = alicloud_cs_kubernetes.k8s.*.worker_nodes
}

output "this_k8s_node_ids" {
  description = "List ids of of cluster node."
  value       = [for _, obj in concat(alicloud_cs_kubernetes.k8s.*.worker_nodes, [{}])[0] : lookup(obj,"id")]
}

output "connections" {
  value = alicloud_cs_kubernetes.k8s.0.connections
}

output "certificate_authority" {
  value = alicloud_cs_kubernetes.k8s.0.certificate_authority
}

output "cluster_ca_cert" {
  value = alicloud_cs_kubernetes.k8s.0.certificate_authority.cluster_cert
}

output "client_cert" {
  value = alicloud_cs_kubernetes.k8s.0.certificate_authority.client_cert
}

output "client_key" {
  value = alicloud_cs_kubernetes.k8s.0.certificate_authority.client_key
}

output "api_server_internet" {
  value = alicloud_cs_kubernetes.k8s.0.connections.api_server_internet
}

output "name" {
  value = alicloud_cs_kubernetes.k8s.0.name
}

output "kubeconfig" {
  value = file(var.kube_config)
}
