#!/bin/bash

mkdir -p tmp/infra
cat .readme.header.md > README.md

if [ ! -e tmp/raw.json ]; then
    gh repo list \
    --no-archived \
    --source \
    --limit 999 \
    --topic homelab \
    --json name,repositoryTopics,url \
    > tmp/raw.json
fi

for line in $(cat tmp/raw.json | jq -r '.[] | "\(.name),\(.url),\(.repositoryTopics[1].name)"'); do
    repo=$(echo $line | cut -f 1 -d ,)
    url=$(echo $line | cut -f 2 -d ,)
    section=$(echo $line | cut -f 3 -d , | cut -f 2- -d -)

    if [[ "${repo}" == "homelab" ]] \
    || [[ "${repo}" == "homelab-template" ]]; then
        service=$repo
    else
        service=$(echo $repo | sed s/homelab-//)
    fi

    if [[ "${section}" =~ "infrastructure" ]]; then
        subsection=$(echo $section | cut -f 2 -d -)
        section=infrastructure
    else subsection=
    fi

    if [ "${subsection}" != "" ]; then
        echo "- [${service}](${url})" >> tmp/infra/${subsection}.md
    else
        echo "- [${service}](${url})" >> tmp/$section.md
    fi
done

for f in $(ls tmp/infra/*.md | sort); do
    sub=$(basename $f | cut -f 1 -d .)
    echo >> tmp/infrastructure.md
    echo "### ${sub}" >> tmp/infrastructure.md
    echo >> tmp/infrastructure.md
    cat $f | sort >> tmp/infrastructure.md
done
rm -rf tmp/infra/

for f in $(ls tmp/*.md | sort); do
    echo >> README.md
    section=$(basename $f | cut -f 1 -d .)
    echo "## ${section}" >> README.md
    echo >> README.md
    if [[ "${f}" =~ "infra" ]]; then
        cat $f >> README.md
    else
        cat $f | sort >> README.md
    fi
done
rm -rf tmp/*.md
