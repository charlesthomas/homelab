# storage

cluster storage is provided via two mechanisms:

1. distributed block storage via [longhorn](/longhorn/)
1. [nfs](/nfs/)

## backups

All longhorn PVCs (regardless of reclaim policy) are snapshotted daily, and backed up weekly.
14 snapshots and 52 backups are kept. Backups are written to nas01:/volume1/critical/, which is rsynced offsite daily to nas02.

## storageClasses

- `longhorn`
  - default storage class
  - replica size 3
- `longhorn-retain`
  - replica size 3
  - reclaim policy set to retain

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
