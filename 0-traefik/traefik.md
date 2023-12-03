# traefik

```bash
helm repo add traefik https://traefik.github.io/charts
helm upgrade --install --create-namespace --namespace traefik traefik traefik/traefik --values 0-traefik/values.yaml
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
