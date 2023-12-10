# zigbee2mqtt

receives zigbee messages, translates them to mqtt, sends them to [home-assistant](80-home-assistant/README.md) via mosquitto

**there's no helm chart**

it's in the same position home-assistant is: the most up-to-date one i could find is k8s-at-home which is defunct

## network_key

**if you network_key changes you have to re-pair all your devices!**

if you lose the secret

```bash
kubectl -n zigbee2mqtt create secret generic zigbee2mqtt
kubectl -n zigbee2mqtt edit secret zigbee2mqtt
```

```yaml
data:
    secrets: <output of "python3 80-zigbee2mqtt/generate_network_key.py | base64" >
```

## install

```bash
kubectl apply -f 80-zigbee2mqtt/zigbee2mqtt.yaml
```