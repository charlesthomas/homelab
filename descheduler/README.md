# descheduler

"deschedule" (remove) pods violating _some_ policy

in particular, boot [zigbee2mqtt](/zigbee2mqtt/) if the zigbee dongle is moved to a different node

## get the chart

```bash
helm repo add descheduler https://kubernetes-sigs.github.io/descheduler/
helm repo update
```

## get the stock values

```bash
helm show values descheduler/descheduler > descheduler/stock-values.yaml
```

## install

```bash
helm upgrade --install descheduler descheduler/descheduler \
--create-namespace --namespace descheduler \
--values descheduler/values.yaml
```
