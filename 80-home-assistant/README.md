# home-assistant

Home Assistant has no helm chart I could find that wasn't deprecated!

## automations are a pain

they have to be loaded in via a file that's referenced in the main config

that main config is in a configmap, and so are the automations

but making a single configmap that's an enourmous blob b/c it's two text files is
supremely unweildy

instead, every time you make a new automation, extract it out of home-assistant, and store
it in a yaml file in `80-home-assistant/automations/`.

then run `80-home-assistant/generate-configmap.sh`, and it will
generate a single yaml list from each of the individual automations files.
then it will load that list as a string value into the appropriate key in the configmap,
which you can then load like so:

```bash
80-home-assistant/generate-configmap.sh && \
kubectl apply -f 80-home-assistant/configmap.yaml
```

## installation

there are a bunch of helm charts for home-assistant, but they're all deprecated.
so just do this:

```bash
kubectl apply -f 80-home-assistant/home-assistant.yaml
```
