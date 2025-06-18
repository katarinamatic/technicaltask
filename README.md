# technicaltask

minikube start


helm repo add traefik https://traefik.github.io/charts
helm repo update

kubectl create ns traefik-v2
helm install --namespace=traefik-v2 traefik traefik/traefik

helm install --create-namespace --namespace dev  bla staticapp -f staticapp/values-dev.yaml
helm install --create-namespace --namespace prod  bla staticapp -f staticapp/values-prod.yaml

sudo vim /etc/hosts
-> 
127.0.0.1   example-dev.local
127.0.0.1   example-prod.local

minikube tunnel
