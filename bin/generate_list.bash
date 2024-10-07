#!/bin/bash
set -e

for cmd in "gh git jq"; do
    x=$(which $cmd)
    if [[ "${x}" == "" ]]; then
        echo $cmd not installed
        exit 1
    fi
done

mkdir -p tmp/infra

if [ ! -e tmp/raw.json ]; then
    gh repo list \
    --no-archived \
    --source \
    --limit 999 \
    --topic homelab \
    --json name,repositoryTopics,url \
    > tmp/raw.json
fi

cat .readme.header.md > README.md

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

list=$(ls tmp/infra/*.md | sort)
[[ "${list}" == "" ]] && exit 1
for f in $list; do
    sub=$(basename $f | cut -f 1 -d .)
    echo >> tmp/infrastructure.md
    echo "### ${sub}" >> tmp/infrastructure.md
    echo >> tmp/infrastructure.md
    cat $f | sort >> tmp/infrastructure.md
done
rm -rf tmp/infra/

list=$(ls tmp/*.md | sort)
[[ "${list}" == "" ]] && exit 1
for f in $list; do
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

[ $(git status --porcelain README.md | wc -l) -eq 0 ] && exit 0

git add README.md
git commit -m "docs: update readme"
git push
