# metallb

assigning virtual IPs to point at the k3s nodes

metallb was doing super weird stuff when i tried to use it as an upstream chart

install its chart, and then `kubectl apply` the `IPAddressPools`

```bash
helm upgrade --install metallb metallb/metallb --create-namespace --namespace metallb --values 0-metallb/values.yaml && \
kubectl apply -f 0-metallb/ip-address-pools.yaml
```

**note**: `/32` is CIDR for 1 address

## pools

### internal

192.168.1.40 - 192.168.1.99

external to the k3s cluster, but internal to the network.
ie not exposed to the internet

```yaml
annotations:
  metallb.universe.tf/address-pool: internal
```   

### external

192.168.1.5/32

for port forwarding from the router,
once i have services i want to be able to access from the open internet

```yaml
annotations:
  metallb.universe.tf/address-pool: external
```   

### dns

192.168.1.8/32

i probably could have done this with a different annotation,
and maybe without a pool at all,
but i wanted to make sure .8 was always accessible for [pihole](/0-pihole/pihole.md)


```yaml
annotations:
  metallb.universe.tf/address-pool: dns
```   
