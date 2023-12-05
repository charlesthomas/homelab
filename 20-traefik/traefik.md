# traefik

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
kubectl apply -f o-traefik/dashboard-ingress.yaml
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
