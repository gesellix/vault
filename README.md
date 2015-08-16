# vault
A Dockerized Vault

see the [Vault project](https://www.vaultproject.io/) for details.

usage: `docker run --rm -it gesellix/vault version`

```
docker run --rm -it -v `pwd`/server.hcl.tpl:/vault/server.hcl.tpl -p 8200:8200 gesellix/vault server -config=/vault/server.hcl
```

