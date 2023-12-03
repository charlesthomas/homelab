# external-dns

monitors new `LoadBalancer` services and updates [pihole](0-pihole/pihole.md) DNS server with new domain maps to IPs

[🔗 github](https://github.com/kubernetes-sigs/external-dns#status-of-providers)

## annotations

in order to create an A record for a `LoadBalancer` service:

```yaml
annotations:
    external-dns.alpha.kubernetes.io/hostname: loadbalancer-service.local    
```

where `loadbalancer-service.local` is the name of the service, ie `traefik.local`

in order to create a CNAME alias for an `Ingress`:

```yaml
annotations:
    external-dns.alpha.kubernetes.io/hostname: ingress-service.local
    external-dns.alpha.kubernetes.io/target: loadbalancer-service.local
```

where `loadbalancer-service.local` is the same as the A record above, ie `traefik.local`, and `ingress-service.local` is a service using that `LoadBalancer`'s `Ingress`, ie `grafana.local`

## get the chart

```bash
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
```

## default values
```bash
helm show values external-dns/external-dns > 0-external-dns/values.og.yaml
```

## installation

### create the namespace

```bash
kubectl create namespace external-dns
```

### get the pihole-admin secret

```bash
kubectl get -n pihole secret pihole-admin -o yaml | sed 's/namespace: pihole/namespace: external-dns/' | kubectl apply -f -
```

```bash
helm upgrade --install external-dns external-dns/external-dns --create-namespace --namespace external-dns --values 0-external-dns/values.yaml
```
