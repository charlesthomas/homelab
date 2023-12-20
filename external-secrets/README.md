# external-secrets

manages secrets by syncing them from [vault-warden](/vault-warden)

bitwarden doesn't provide a docker image, and i couldn't find a trustworthy enough looking one.

[external-secrets documentation](https://external-secrets.io/v0.9.9/examples/bitwarden/) provides everything you need in order to build an image yourself,

so i did that here: [charlesthomas/bitwarden-cli](https://github.com/charlesthomas/bitwarden-cli)

it publishes a public image as (at the time of this writing):

```bash
ghcr.io/charlesthomas/bitwarden-cli:2023.12.1
```

which is the image referenced in `bitwarden-cli.yaml`'s Deployment

## create namespace

```bash
kubectl create namespace external-secrets
```

## create secret

```bash
kubectl -n external-secrets create secret generic bitwarden-cli
kubectl -n external-secrets edit secret bitwarden-cli
```

```yaml
data:
    BW_HOST: <base64 host>
    BW_USERNAME: <base64 username>
    BW_PASSWORD: <base64 password>
```

# install

```bash
kubectl kustomize --enable-helm external-secrets/ | kubectl apply -f -
```
