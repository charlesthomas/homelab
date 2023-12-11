# moquitto

mqtt server to broker data between [zigbee2mqtt](/zigbee2mqtt/) & [home-assistant](/home-assistant/)

## get the chart

```bash
helm repo add truecharts https://charts.truecharts.org/
helm repo update
```

## get the stock values

```bash
helm show values truecharts/mosquitto > mosquitto/stock-values.yaml
```

## install

```bash
helm upgrade --install mosquitto truecharts/mosquitto \
--create-namespace --namespace mosquitto \
--version 11.0.17 \
--values mosquitto/values.yaml
```

## uninstall

```bash
helm uninstall --namespace mosquitto mosquitto
```
