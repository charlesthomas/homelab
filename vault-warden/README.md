# vault-warden

open source server that's fully compatbile with bitwarden clients

includes things that bitwarden paywalls like TOTP

## the chart

this is based on the chart below, but it was deploying as a statefulset, which i didn't like
so i converted it to a deployment

```bash
helm repo add vaultwarden https://guerzon.github.io/vaultwarden
```

## create admin secret

```bash
kubectl create namespace vault-warden
kubectl -n vault-warden create secret generic vault-warden
kubectl -n vault-warden edit secret vault-warden
```

```yaml
stringData:
    admin-token: <NON-base64 encoded argon2 token>
```

```bash
pbpaste | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4 | pbcopy
```

## install

```bash
kubectl apply -f vault-warden/vault-warden.yaml
```
