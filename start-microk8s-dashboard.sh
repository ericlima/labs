#!/bin/bash
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 & firefox https://127.0.0.1:10443