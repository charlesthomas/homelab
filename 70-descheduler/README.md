# descheduler

"deschedule" (remove) pods violating some policy

in particular, boot [zigbee2mqtt](80-zigbee2mqtt/README.md) if the zigbee dongle is moved to a different node

## get the chart

```bash
helm repo add descheduler https://kubernetes-sigs.github.io/descheduler/
helm repo update
```

## get the stock values

```bash
helm show values descheduler/descheduler > 70-descheduler/stock-values.yaml
```

## install

```bash
helm upgrade --install descheduler descheduler/descheduler \
--create-namespace --namespace descheduler \
--values 70-descheduler/values.yaml
```
