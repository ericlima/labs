#!/bin/bash
kubectl create namespace yb-demo
helm install yb-demo yugabytedb/yugabyte --set resource.master.requests.cpu=0.5,resource.master.requests.memory=0.5Gi,resource.tserver.requests.cpu=0.5,resource.tserver.requests.memory=0.5Gi,replicas.master=1,replicas.tserver=1,enableLoadBalancer=False --namespace yb-demo

