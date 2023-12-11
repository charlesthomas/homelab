# external-dns

monitors new `LoadBalancer` services and updates [pihole](0-pihole/pihole.md) and cloudflare DNS servers with new domain maps to IPs

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
    external-dns.alpha.kubernetes.io/target: tld (eg crt.house)
```

## get the chart

```bash
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
```

## default values
```bash
helm show values external-dns/external-dns > 0-external-dns/stock-values.yaml
```

## installation

### create the namespace

```bash
kubectl create namespace external-dns
```

### add cloudflare api token

```bash
kubectl -n external-dns create secret generic cloudflare
kubectl -n external-dns edit secret cloudflare
```

```yaml
data:
    cf-api-token: <base64 cf api token>
```

### add pihole secret

```bash
kubectl -n pihole get secret pihole-admin -o yaml | sed 's/namespace: pihole/namespace: external-dns/' | kubectl apply -f -
```

```bash
helm upgrade --install external-dns-pihole external-dns/external-dns \
--create-namespace --namespace external-dns \
--values 0-external-dns/pihole.yaml && \
helm upgrade --install external-dns-cloudflare external-dns/external-dns \
--create-namespace --namespace external-dns \
--values 0-external-dns/cloudflare.yaml
```
