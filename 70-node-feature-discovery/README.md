# node-feature-discovery

allows scheduling pods by hardware on nodes

using this to lock zigbee2mqtt onto the node my zigbee dongle is plugged into

[source](https://kubernetes-sigs.github.io/node-feature-discovery/v0.11/get-started/features.html#usb)

## get the chart

```bash
helm repo add nfd https://kubernetes-sigs.github.io/node-feature-discovery/charts
helm repo update
```

## get the default values

```bash
helm show values nfd/node-feature-discovery > 70-node-feature-discovery/stock-values.yaml
```

## install

```bash
helm upgrade --install nfd nfd/node-feature-discovery \
--create-namespace --namespace nfd \
--values 70-node-feature-discovery/values.yaml
```

## uninstall

```bash
helm uninstall --namespace nfd nfd
```
