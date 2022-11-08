storage "raft" {
  path    = "./vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

disable_mlock = true

api_addr = "http://0.0.0.0::8200"
cluster_addr = "http://0.0.0.0::8201"
ui = true
