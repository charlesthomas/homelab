#!/bin/bash

# this script loads in all dashboard files in grafana/dashboards/*.json
# into a single configmap, which then gets mounted as /etc/dashboards.
# values.yaml includes a dashboardProvider to load all the dashboards from /etc/dashboards

cp grafana/etc-dashboards.partial.yaml grafana/.etc-dashboards.in.yaml
for yaml in $(ls grafana/dashboards/*.json); do
    bname=$(basename $yaml)
    cmd="yq '.data.\"${bname}\" = load_str(\"${yaml}\")' grafana/.etc-dashboards.in.yaml > grafana/.etc-dashboards.out.yaml"
    eval $cmd
    mv grafana/.etc-dashboards.out.yaml grafana/.etc-dashboards.in.yaml
done
mv grafana/.etc-dashboards.in.yaml grafana/etc-dashboards.yaml
