# technicaltask

## Task
* Deploy a Traefik server
* That points to a second pod that serves a static site (could be nginx) two stages, dev and prod
* the static website should show a Text that is injected as an environment variable that is a secret
    i.e. Hello World i am on [dev/prod]. and this is my [secret]. 
* should be served https with self-signed
* should use Kubernetes and helm, on a public git repo
* bootstrapping scripts using a mini-kube, or similar are preferred 

## Prerequisites
* [minikube](https://minikube.sigs.k8s.io/docs/start)
* [helm](https://helm.sh/docs/intro/install/)

## Repository structure
```text
staticapp/                  # helm chart directory
├── templates/
│   ├── lets-encrypt/       # letsencrypt issuer and cert templates
│   │   ├── ...
│   ├── self-signed/         # selfsigned issuer and cert templates
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

## Assumptions
* latest versions of minikube (Kubernetes), helm
* since there is a helm chart for Traefik as a k8s Ingress controller, it was deployed that way. It could be deployed in other ways but since the task needs the service exposed, this seemed appropriate
* the secret that is injected as an environment variable was placed in values-_stage_.yaml assuming that there will be testing and maybe the tester would like to make sure the value changes, even though providing opaque secrets in values is not secure (sealed-secrets-controller could be used to generate secrets that would be safe to push to git, or external Key Management Store could be used) 
