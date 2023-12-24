# plex

plex was a massive hassle, because it just won't work without

```yaml
hostNetwork: true
```

but the chart doesn't set it

the chart has several other bugs, and one design thing i don't like: it's a statefulset

rather than waste more time farting around with it, i just converted it myself, and i'm not going to use the chart

## claiming

**BEFORE** applying the file, i went to [plex.tv/claim](https://plex.tv/claim) and got a claim token

then i manually injected it into `plex/plex.yaml` in the deployment template spec envs (search for `CLAIMGOESHERE` and replace it)

## duplicate cert secret

```bash
kubectl -n nginx-crt-house get secret crt.house -o yaml | \
sed 's/namespace: nginx-crt-house/namespace: plex/' | \
kubectl apply -f -
```

## installation

```bash
kubectl apply -f plex/plex.yaml
```

## configuration

even though i don't think i should have had to do this, i still did a port-forward to configure the media server for the first time

🤞 i don't have to do it again if the pod rolls, because it was a giant pain in the ass

```bash
kubectl -n plex port-forward svc/plex-media-server 32400:32400
```

## transcoding

hardware transcoding _appears to be working_ ?

i used [this guide](https://www.reddit.com/r/selfhosted/comments/121vb07/plex_on_kubernetes_with_intel_igpu_passthrough/) to get it to work

and it depends on

1. **manually labeling nodes** with the following

```yaml
metadata:
  labels:
    intel.feature.node.kubernetes.io/gpu: "true"
```

2. installing [intel-device-plugins-operator](/intel-device-plugins-operator/)

3. installing [intel-device-plugins-gpu](/intel-device-plugins-gpu/)

quoting the important bits in case reddit implodes before this repo does:

> Here's a step-by-step guide to get you started:
> 
> Tagging nodes: Tag your nodes that have a GPU with the label intel.feature.node.kubernetes.io/gpu=trueThis ensures that your GPU-dependent deployments will use the appropriate machines.
> 
> Install a certificate manager: You'll need a certificate manager, and the recommended Helm chart is available at https://cert-manager.io/docs/installation/helm/.
> 
> Install the Intel Device Plugin Operator: More information on this can be found at https://github.com/intel/intel-device-plugins-for-kubernetes/blob/main/cmd/operator/README.md. I highly recommend installing this operator via the Helm chart available here: https://github.com/intel/helm-charts/tree/main/charts/device-plugin-operator.
> 
> Install the GPU Plugin: This plugin is also provided by Intel and available as a Helm chart at https://github.com/intel/helm-charts/tree/main/charts/gpu-device-plugin.
> 
> Install Plex: I created my own Helm chart for this, but you can use the plexinc/pms-dockerimage. The crucial part is to include the following snippet of code in your deployment to ensure that your pod requests the Intel iGPU of your machine:
>
>
```yaml
resources: 
    requests: 
        gpu.intel.com/i915: "1" 
    limits: 
        gpu.intel.com/i915: "1" 
```
