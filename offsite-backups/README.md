# offsite backups

sync nas01/critical and nas01/time-machine to nas02, which is hosted off site

uses a [custom alpine image with rsync baked in](https://github.com/charlesthomas/alpine-rsync) along with a tailscale sidecar to sync nas01:/volume1/crticial and nas01:/volume1/time-machine offsite to nas02

## installation

```bash
kubectl apply -k offsite-backups/
```
