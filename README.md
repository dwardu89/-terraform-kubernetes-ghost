# Ghost Kubernetes Deployment
RUN `terraform apply`
After terraform is complete, you can run `bootstrap.sh` in `bootstrap_k8s`

you will need to update the URl variable in `ghost.yaml` to reflect the load balancer url for the service created.
