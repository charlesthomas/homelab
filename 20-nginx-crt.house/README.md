# nginx-crt.house

ingress controller for crt.house

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > 20-nginx-crt.house/stock-values.yaml
```

## create namespace

```bash
kubectl create namespace nginx-crt-house
```

## create certificate

```bash
kubectl apply -f 20-nginx-crt.house/certificate.yaml
```

## install

```bash
helm upgrade --install nginx-crt.house oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-crt-house \
--version 1.0.2 \
--values 20-nginx-crt.house/values.yaml
```
