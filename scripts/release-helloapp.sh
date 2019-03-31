#!/bin/bash
echo "start tiller"
export KUBECONFIG=$HOME/.kube/kubeconfig
helm tiller start-ci
export HELM_HOST=127.0.0.1:44134
result=$(eval helm ls | grep helloapp) 
if [ $? -ne "0" ]; then 
   helm install --timeout 180 --name helloapp charts/helloapp
else 
   helm upgrade --timeout 180 helloapp charts/helloapp
fi
echo "stop tiller"
helm tiller stop 