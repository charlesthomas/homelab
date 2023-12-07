# nginx-crt.house

ingress controller for crt.house

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > 20-nginx-crt-house-external/stock-values.yaml
```

## install

```bash
helm upgrade --install crt-house-external oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-crt-house \
--version 1.0.2 \
--values 20-nginx-crt-house-external/values.yaml
```
