# storage

cluster storage is provided via two mechanisms:

1. distributed block storage via [longhorn](/longhorn/)
1. [nfs](/nfs/)

## storageClasses

- `longhorn`
  - default storage class
  - provides distributed storage across the cluster
  - replica size 2 inside the cluster
  - NO additional redundancy
    - including offsite backup
- `nfs-critical`
  - maps to `nfs://nas01/critical`
  - offsite backup to `nas02`
  - 7TB quota
- `nfs-k3s`
  - maps to `nfs://nas01/k3s`
  - NO offsite backup
  - no quota

## fixing node partition size
for some reason, my minimal Ubuntu server install created 100GB volumes on a 256GB drive

[based on this](https://askubuntu.com/questions/498709/how-can-i-resize-an-active-lvm-partition) i used the following commands to correct the partition

```bash
sudo lvresize ubuntu-vg/ubuntu-lv -L +135g && \
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

### additional

for confirming sizes:

```bash
df -h
```

for identifying drive names & mapping:

```bash
sudo pvdisplay
```
