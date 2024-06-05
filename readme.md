# Generate certificate with azure http chalange

## Build image

```
docker build -t az-gen .
```

## Run 
```
docker run --rm -it -e DOMAIN=<> -e AZURE_STORAGE_ACCOUNT=<> -e AZURE_STORAGE_KEY=<> -e EMAIL=<> -v ./out:/cert az-gen:latest
```