# Was the raft log corrupted, truncated, or lost?

I killed the power to one of the nodes in the cluster, and it did not come back online.

`journalctl -xeu k3s.service` showed this:

```bash
Nov 30 20:55:23 k3s2 k3s[4590]: {"level":"panic","ts":"2023-11-30T20:55:23.457083Z","logger":"raft","caller":"etcdserver/zap_raft.go:101","msg":"tocommit(1375759) is out of range [lastIndex(0)]. Was the raft log corrupted, truncated, or lost?","stacktrace":"go.etcd.io/etcd/server/v3/etcdserver.(*zapRaftLogger).Panicf\n\t/go/pkg/mod/github.com/k3s-io/etcd/server/v3@v3.5.9-k3s1/etcdserver/zap_raft.go:101\ngo.etcd.io/etcd/raft/v3.(*raftLog).commitTo\n\t/go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/log.go:237\ngo.etcd.io/etcd/raft/v3.(*raft).handleHeartbeat\n\t/go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:1508\ngo.etcd.io/etcd/raft/v3.stepFollower\n\t/go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:1434\ngo.etcd.io/etcd/raft/v3.(*raft).Step\n\t/go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:975\ngo.etcd.io/etcd/raft/v3.(*node).run\n\t/go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/node.go:356"}
Nov 30 20:55:23 k3s2 k3s[4590]: panic: tocommit(1375759) is out of range [lastIndex(0)]. Was the raft log corrupted, truncated, or lost?
Nov 30 20:55:23 k3s2 k3s[4590]: goroutine 281 [running]:
Nov 30 20:55:23 k3s2 k3s[4590]: go.uber.org/zap/zapcore.CheckWriteAction.OnWrite(0x0?, 0x1b?, {0x0?, 0x0?, 0xc0003640a0?})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/go.uber.org/zap@v1.24.0/zapcore/entry.go:198 +0x65
Nov 30 20:55:23 k3s2 k3s[4590]: go.uber.org/zap/zapcore.(*CheckedEntry).Write(0xc0012c20d0, {0x0, 0x0, 0x0})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/go.uber.org/zap@v1.24.0/zapcore/entry.go:264 +0x3ec
Nov 30 20:55:23 k3s2 k3s[4590]: go.uber.org/zap.(*SugaredLogger).log(0xc000bad6d8, 0x4, {0x5a2bdc5?, 0x40d7c5?}, {0xc000365080?, 0x4d6dea0?, 0x0?}, {0x0, 0x0, 0x0})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/go.uber.org/zap@v1.24.0/sugar.go:295 +0xee
Nov 30 20:55:23 k3s2 k3s[4590]: go.uber.org/zap.(*SugaredLogger).Panicf(...)
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/go.uber.org/zap@v1.24.0/sugar.go:189
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/server/v3/etcdserver.(*zapRaftLogger).Panicf(0x14fe0f?, {0x5a2bdc5?, 0x0?}, {0xc000365080?, 0xc000970de0?, 0x4854a5?})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/server/v3@v3.5.9-k3s1/etcdserver/zap_raft.go:101 +0x49
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/raft/v3.(*raftLog).commitTo(0xc0004d3ab0, 0x14fe0f)
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/log.go:237 +0x103
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/raft/v3.(*raft).handleHeartbeat(_, {0x8, 0x6bb91a8a4577d976, 0x9754d4208fa9e54b, 0x2, 0x0, 0x0, {0x0, 0x0, 0x0}, ...})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:1508 +0x45
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/raft/v3.stepFollower(_, {0x8, 0x6bb91a8a4577d976, 0x9754d4208fa9e54b, 0x2, 0x0, 0x0, {0x0, 0x0, 0x0}, ...})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:1434 +0x3d8
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/raft/v3.(*raft).Step(_, {0x8, 0x6bb91a8a4577d976, 0x9754d4208fa9e54b, 0x2, 0x0, 0x0, {0x0, 0x0, 0x0}, ...})
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/raft.go:975 +0x1335
Nov 30 20:55:23 k3s2 k3s[4590]: go.etcd.io/etcd/raft/v3.(*node).run(0xc0012c6fc0)
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/node.go:356 +0x925
Nov 30 20:55:23 k3s2 k3s[4590]: created by go.etcd.io/etcd/raft/v3.RestartNode
Nov 30 20:55:23 k3s2 k3s[4590]:         /go/pkg/mod/github.com/k3s-io/etcd/raft/v3@v3.5.9-k3s1/node.go:244 +0x24a
Nov 30 20:55:23 k3s2 systemd[1]: k3s.service: Main process exited, code=exited, status=2/INVALIDARGUMENT
```

to recover, i had to do the following:

1. `kubectl delete node k3s2`
1. `ssh k3s2`
1. `sudo rm -rf /var/lib/rancher/k3s/server/db/etcd`
1. `sudo service k3s start`
