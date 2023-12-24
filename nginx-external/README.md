# nginx-external

external ingress controller for crt.lol (default) and crt.house

this one handles external traffic
(uses a different metallb annotation to get a different IP;
the one that the router has NAT configured on)

## stock values

```bash
helm show values oci://ghcr.io/nginxinc/charts/nginx-ingress > nginx-external/stock-values.yaml
```

## install

```bash
helm upgrade --install external oci://ghcr.io/nginxinc/charts/nginx-ingress \
--create-namespace --namespace nginx-external \
--version 1.0.2 \
--values nginx-external/values.yaml
```
