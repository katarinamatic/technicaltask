#! bash

# start minikube cluster
minikube start
echo "\n--- minikube started ---\n"

# add traefik and cert-manager helm repo
helm repo add traefik https://traefik.github.io/charts
helm repo add jetstack https://charts.jetstack.io
helm repo update
echo "\n--- helm repos added ---\n"

# install traefik kubernetes controller and cert manager
helm install traefik traefik/traefik --namespace traefik --create-namespace -f values-traefik.yaml
echo "\n--- traefik installed ---\n"

helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.18.0 --set crds.enabled=true
echo "\n--- cert-manager installed ---\n"
