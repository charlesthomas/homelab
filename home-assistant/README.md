# home-assistant

Home Assistant has no helm chart I could find that wasn't deprecated!

## automations are a pain

they have to be loaded in via a file that's referenced in the main config

that main config is in a configmap, and so are the automations

but making a single configmap that's an enourmous blob b/c it's two text files is
supremely unweildy

instead, every time you make a new automation, extract it out of home-assistant, and store
it in a yaml file in `home-assistant/automations/`.

then run `home-assistant/generate-automations.sh`, and it will
generate a single yaml list from each of the individual automations files.
then it will load that list as a string value into the appropriate key in the configmap,
which you can then load like so:

```bash
home-assistant/generate-automations.sh && \
kubectl apply -f home-assistant/automations-yaml.yaml
```

## duplicate the cert secret

```bash
kubectl -n nginx-crt-house get secret crt.house -o yaml | \
sed 's/namespace: nginx-crt-house/namespace: home-assistant/' | \
kubectl apply -f -
```

## installation

there are a bunch of helm charts for home-assistant, but they're all deprecated.
so just do this:

```bash
kubectl apply -f home-assistant/external-secret.yaml && \
kubectl apply -f home-assistant/configuration-yaml.yaml && \
kubectl apply -f home-assistant/home-assistant.yaml
```
