#!/bin/bash

# this script loads in all dashboard files in 30-grafana/dashboards/*.json
# into a single configmap, which then gets mounted as /etc/dashboards.
# values.yaml includes a dashboardProvider to load all the dashboards from /etc/dashboards

cp 30-grafana/etc-dashboards.partial.yaml 30-grafana/.etc-dashboards.in.yaml
for yaml in $(ls 30-grafana/dashboards/*.json); do
    bname=$(basename $yaml)
    cmd="yq '.data.\"${bname}\" = load_str(\"${yaml}\")' 30-grafana/.etc-dashboards.in.yaml > 30-grafana/.etc-dashboards.out.yaml"
    eval $cmd
    mv 30-grafana/.etc-dashboards.out.yaml 30-grafana/.etc-dashboards.in.yaml
done
mv 30-grafana/.etc-dashboards.in.yaml 30-grafana/etc-dashboards.yaml
