# metallb

assigning virtual IPs to point at the k3s nodes

metallb was doing super weird stuff when i tried to use it as an upstream chart

install its chart, and then `kubectl apply` the `IPAddressPools`

```bash
helm upgrade --install metallb metallb/metallb --create-namespace --namespace metallb --values 0-metallb/values.yaml && \
kubectl apply -f 0-metallb/ip-address-pools.yaml
```

**note**: `/32` is CIDR for 1 address
