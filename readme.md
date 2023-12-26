# Generate certificate with azure http chalange

1. `./install.sh`
2. Set variable values in `gen.sh`
3. `/gen.sh`

To check:
```
openssl s_client -connect <domain>:443 | grep NotAfter
```