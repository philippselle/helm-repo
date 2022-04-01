#!/usr/bin/env bash

VERSION=$(grep 'version:' helm-chart-sources/pipeline/Chart.yaml | cut -d ":" -f2)
NEXTVERSION=$(echo ${VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')

sed -i '' 's,'"$VERSION"', '"$NEXTVERSION"',' helm-chart-sources/pipeline/Chart.yaml 

sed -i '' 's,'"$VERSION"', '"$NEXTVERSION"',' pipeline-release/Chart.yaml 

helm package helm-chart-sources/pipeline

helm repo index --url https://philippselle.github.io/helm-repo/ --merge index.yaml .

git add .

git commit -m "update Helm Chart"

git push

echo "########################################"
echo "New Helm Chart released: $NEXTVERSION"
echo "########################################"