# influxdb2

## creating influxdb-auth secret

until secret management is sorted, secret creation needs to happen manually before installing `influxdb2`

```bash
kubectl create namespace influxdb2
kubectl -n influxdb2 create secret generic influxdb-auth
kubectl -n influxdb2 edit secret influxdb-auth
```

append the following to `secret/influxdb-auth`:

```yaml
data:
  admin-password: <base64-encoded-admin-password>
  admin-token: <base64-encoded-admin-token>
```

These values are in the password manager under `influxdb-auth`.

One at a time, copy each to the clipboard from the password manager, and base64 encode them with:

```bash
# macOS
pbpaste | base64 | pbcopy

# linux
xclip -selection clipboard -o | base64 | xclip -selection clipboard
```

## installation

```bash
helm repo add influxdata https://helm.influxdata.com/ && \
helm upgrade --install --create-namespace --namespace influxdb2 influxdb2 influxdata/influxdb2 --values 20-influxdb2/values.yaml
```

## uninstallation

```bash
helm uninstall --namespace influxdb2 influxdb2
```
