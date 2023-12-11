# nginx-crt-house-external

ingress controller for crt.house

this one handles external traffic
(uses a different metallb annotation to get a different IP;
the one that the router has NAT configured on)

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > nginx-crt-house-external/stock-values.yaml
```

## install

```bash
helm upgrade --install crt-house-external oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-crt-house \
--version 1.0.2 \
--values nginx-crt-house-external/values.yaml
```
