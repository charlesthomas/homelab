# pihole

DNS server

## secret required

```bash
kubectl create namespace pihole
kubectl create -n pihole secret generic pihole-admin
```

## get the chart

```bash
helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/
```

## installation

```bash
helm upgrade --install pihole mojo2600/pihole \
--create-namespace --namespace pihole \
--values pihole/values.yaml
```
