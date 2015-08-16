backend "inmem" {
  path = "/vault/data"
}

listener "tcp" {
 address = "{{ .Env.CONTAINER_IP }}:8200"
 tls_disable = 1
}

disable_mlock = true

