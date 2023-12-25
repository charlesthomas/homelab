# shlink

URL shortener

there's no official helm chart. i found [this one](https://github.com/neilfrndes/shlink-helm-chart), but it hasn't had an update in 3 years, so i used it to render `shlink/shlink.yaml` instead

## install mariadb

```bash
kubectl apply -f shlink/mariadb.yaml
```

## install shlink

```bash
kubectl apply -f shlink/shlink.yaml
```

## install shlink web client

```bash
kubectl apply -f shlink/web-client.yaml
```
