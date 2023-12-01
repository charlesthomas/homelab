# traefik

```bash
helm repo add traefik https://traefik.github.io/charts
helm upgrade --install --create-namespace --namespace traefik traefik traefik/traefik --values 0-traefik/values.yaml
```
