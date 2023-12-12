# vault-warden

open source server that's fully compatbile with bitwarden clients

includes things that bitwarden paywalls like TOTP

## the chart

this is based on the chart below, but it was deploying as a statefulset, which i didn't like
so i converted it to a deployment

```bash
helm repo add vaultwarden https://guerzon.github.io/vaultwarden
```

## install

```bash
kubectl apply -f vault-warden/vault-warden.yaml
```
