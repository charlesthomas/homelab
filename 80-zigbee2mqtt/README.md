# zigbee2mqtt

receives zigbee messages, translates them to mqtt, sends them to [home-assistant](80-home-assistant/README.md) via mosquitto

**there's no helm chart**

it's in the same position home-assistant is: the most up-to-date one i could find is k8s-at-home which is defunct

## install

```bash
kubectl apply -f 80-zigbee2mqtt/zigbee2mqtt.yaml
```
