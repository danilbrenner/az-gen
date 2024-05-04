# Generate certificate with azure http chalange

## Build image

```
docker build -t az-gen .
```

## Run 
```
docker run --rm -e DOMAIN=<> -e AZURE_STORAGE_ACCOUNT=<> -e AZURE_STORAGE_KEY=<> -v <path>:/cert az-gen:latest
```