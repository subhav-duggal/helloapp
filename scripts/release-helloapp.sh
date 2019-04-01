#!/bin/bash
TAG=$1
echo "start tiller"
export KUBECONFIG=$HOME/.kube/kubeconfig
helm tiller start-ci
export HELM_HOST=127.0.0.1:44134
result=$(eval helm ls | grep helloapp) 
if [ $? -ne "0" ]; then 
   helm install --timeout 180 --name helloapp --set image.tag=$TAG charts/helloapp
else 
   helm upgrade --timeout 180 helloapp --set image.tag=$TAG charts/helloapp
fi
echo "stop tiller"
helm tiller stop 