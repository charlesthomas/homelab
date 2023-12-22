# plex

## get the chart

```bash
helm repo add plex https://raw.githubusercontent.com/plexinc/pms-docker/gh-pages
helm repo update
```

## get the stock values

```bash
helm show values plex/plex-media-server > plex/stock-values.yaml
```

## kustomize build

"claiming" the server is a huge hassle. i couldn't get it to work via `kubectl port-forward`, and because plex insists on doing a bunch of bullshit to make remote access "easier," directly accessing the URL i am serving it from **DOESN'T LET ME ACCESS THE SERVICE** to configure it

i also tried mounting the claim token as an `extraEnv`, but of course it wouldn't accept

```yaml
extraEnv:
    PLEX_CLAIM:
        valueFrom:
            secretRef:
                name: plex-claim
                key: claim-token
```

it rendered it as a bunch of garbage; likely due to [this](https://github.com/charlesthomas/pms-docker/blob/master/charts/plex-media-server/templates/statefulset.yaml#L104)

```yaml
        {{- range $key, $value := .Values.extraEnv }}
        - name: {{ $key }}
          value: {{ $value | quote }} # <-- the `| quote` is the problem, i suspect
        {{- end }}
```

instead:

1. render the file locally `kubectl kustomize --enable-helm plex/ > plex/plex.yaml`
1. get a claim token from [https://plex.tv/claim](https://plex.tv/claim)
1. inject the token into `plex/plex.yaml` manually
1. `kubectl apply -f plex/plex.yaml`

`¯\_(ツ)_/¯`
