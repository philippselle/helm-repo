# helm-repo

update via:
```
$ helm package helm-chart-sources/pipeline
$ helm repo index --url https://philippselle.github.io/helm-repo/ --merge index.yaml .
```