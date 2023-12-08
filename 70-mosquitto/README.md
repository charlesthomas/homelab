# moquitto

mqtt server to broker data between [zigbee2mqtt](/80-zigbee2mqtt/README.md) & [home-assistant](/80-home-assistant/README.md)

## get the chart

```bash
helm repo add truecharts https://charts.truecharts.org/
helm repo update
```

## get the stock values

```bash
helm show values truecharts/mosquitto > 60-mosquitto/stock-values.yaml
```

## install

```bash
helm upgrade --install mosquitto truecharts/mosquitto \
--create-namespace --namespace mosquitto \
--version 11.0.17 \
--values 60-mosquitto/values.yaml
```

## uninstall

```bash
helm uninstall --namespace mosquitto mosquitto
```
