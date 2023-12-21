# zigbee2mqtt

receives zigbee messages, translates them to mqtt, sends them to [home-assistant](/home-assistant/) via mosquitto

**there's no helm chart**

it's in the same position home-assistant is: the most up-to-date one i could find is k8s-at-home which is defunct

## network_key

**if you network_key changes you have to re-pair all your devices!**

if you lose the secret

```bash
kubectl apply -f zigbee2mqtt/external-secrets.yaml
```

```yaml
data:
    secrets: <output of "python3 zigbee2mqtt/generate_network_key.py | base64" >
```

## install

```bash
kubectl apply -f zigbee2mqtt/zigbee2mqtt.yaml
```
