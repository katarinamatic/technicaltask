# technicaltask

## Prerequisites
* [minikube](https://minikube.sigs.k8s.io/docs/start)
* [helm](https://helm.sh/docs/intro/install/)

## Repository structure
```text
staticapp/                  # helm chart directory
├── templates/
│   ├── lets-encrypt/       # letsencrypt issuer and cert templates
│   │   ├── ...
│   ├── selfsigned/         # selfsigned issuer and cert templates
│   │   ├── ...
│   └──  ...                # static app templates
├── README.md
├── setup_cluster.sh        # starts minikube cluster and installs k8s controllers (Traefik, cert-manager)
└── install_stages.sh       # releases prod and dev stages to minikube cluster using helm
```

## Run task
Set up the minikube cluster by running:
```
bash ./setup_cluster.sh
```
Install dev and prod stage to minikube cluster by running:
```
bash ./install_stages.sh
```
Run [minikube tunnel](https://minikube.sigs.k8s.io/docs/commands/tunnel/) to be able to reach the stages on https://example-dev.local and https://example-prod.local:
```
minikube tunnel
```
If services are still unreachable, run:
```
minikube ip
```
and add the output to /etc/hosts
```
...
<minikube_ip>  example-dev.local
<minikube_ip>  example-prod.local
...
```
For macOS M1, add 127.0.0.1 instead of <minikube_ip> 


