# nginx-crt.house

ingress controller for crt.house

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > nginx-crt-house/stock-values.yaml
```

## create namespace

```bash
kubectl create namespace nginx-crt-house
```

## create certificate

```bash
kubectl apply -f nginx-crt-house/certificate.yaml
```

## install

```bash
helm upgrade --install nginx-crt.house oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-crt-house \
--version 1.0.2 \
--values nginx-crt-house/values.yaml
```
