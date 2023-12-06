# traefik

## create certificate

(depends on [cert-manager](/20-cert-manager/cert-manager.md))

```bash
kubectl apply -f 20-traefik/certificate.yaml
```

## add chart

```bash
helm repo add traefik https://traefik.github.io/charts
```

## install chart

```bash
helm upgrade --install --create-namespace --namespace traefik traefik traefik/traefik --values 20-traefik/values.yaml
```

## manually create ingress for dashboard

```bash
kubectl apply -f 20-traefik/dashboard-ingress.yaml
```

## create tlsstore

```bash
kubectl apply -f 20-traefik/tls-store.yaml
```

## IngressClasses

### traefik-internal

preferred:

```yaml
spec:
  ingressClassName: traefik-internal    
```

as annotation:

```yaml
annotations:
  kubernetes.io/ingress.class: traefik-internal
```
