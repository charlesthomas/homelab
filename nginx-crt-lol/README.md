# nginx-crt.lol

ingress controller for crt.lol

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > nginx-crt-lol/stock-values.yaml
```

## create namespace

```bash
kubectl create namespace nginx-crt-lol
```

## create certificate

```bash
kubectl apply -f nginx-crt-lol/certificate.yaml
```

## install

```bash
helm upgrade --install nginx-crt.lol oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-crt-lol \
--version 1.0.2 \
--values nginx-crt-lol/values.yaml
```
