#!/bin/bash
echo "Get cluster config"
aws --region eu-west-1 eks update-kubeconfig --name my-cluster --alias myk8scluster
kubectx myk8scluster

# Look at kiam  
helm3 repo add uswitch https://uswitch.github.io/kiam-helm-charts/charts/
helm3 repo update
helm3 upgrade --install kiam uswitch/kiam -f kiam/values.yaml

sleep 10
kubectl --namespace=default get pods -l "app=kiam,release=kiam"

helm3 repo add external-secrets https://godaddy.github.io/kubernetes-external-secrets/
helm3 install external-secrets/kubernetes-external-secrets -f kubernetes-external-secrets/values.yaml

kubectl create namespace ghost

kubectl apply -f ghost/mysql.yaml
kubectl apply -f ghost/ghost.yaml