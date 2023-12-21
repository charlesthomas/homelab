# cert-manager

handles ssl

## get chart

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

## stock values

```bash
helm show values jetstack/cert-manager > cert-manager/stock-values.yaml
```

## installation

### 1. install cert-manager

```bash
helm upgrade --install \
cert-manager jetstack/cert-manager \
--create-namespace \
--namespace cert-manager \
--version v1.13.2 \
--values cert-manager/values.yaml
```

### 2. create cloudflare secret

```bash
kubectl apply -f external-secret.yaml
```

### 3. install clusterissuer

```bash
kubectl -n cert-manager apply -f cert-manager/cluster-issuer.yaml
```
