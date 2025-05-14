# Generate certificate with azure http chalange

Just create `.env` file and reopen in Dev Container. Run `./gen.sh`.

.env file:

```
DOMAIN=                # The primary domain name used by the application (e.g. example.com)
AZURE_STORAGE_ACCOUNT= # Name of the Azure Storage account used for file storage
AZURE_STORAGE_KEY=     # Access key for the Azure Storage account
EMAIL=                 # Email address used for notifications or authentication
```