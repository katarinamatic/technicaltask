#! bash

helm install --create-namespace --namespace dev  dev staticapp -f staticapp/values-dev.yaml
helm install --create-namespace --namespace prod  prod staticapp -f staticapp/values-prod.yaml
