#!/bin/bash

# this script reads in all the yaml files in 80-home-assistant/automations
# and outputs a single yaml list object with no key,
# and writes the result to 80-home-assistant/list.yaml

# then it reads 80-home-assistant/list.yaml as a single string
# and injects it into the automations.yaml field of
# 80-home-assistant/configmap.partial.yaml

# all you should need to do this is bash and yq
# https://github.com/mikefarah/yq

# ls 80-home-assistant/automations/*.yaml && exit 1
cmd="yq -n '["
sep=
for yaml in $(ls 80-home-assistant/automations/*.yaml); do
    cmd="${cmd}${sep} load(\"${yaml}\")"
    sep=,
done
cmd="${cmd}]' > 80-home-assistant/.list.yaml"

eval $cmd

yq ".data.\"automations.yaml\" = load_str(\"80-home-assistant/.list.yaml\")" 80-home-assistant/configmap.partial.yaml > 80-home-assistant/configmap.yaml
rm 80-home-assistant/.list.yaml
