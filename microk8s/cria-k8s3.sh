#!/bin/bash
multipass launch -n k8s -c 4 -m 4G -d 20G
multipass exec k8s -- sudo snap install microk8s --classic
multipass exec k8s -- sudo iptables -P FORWARD ACCEPT
multipass exec k8s -- sudo usermod -a -G microk8s ubuntu
multipass exec k8s -- sudo chown -f -R ubuntu ~/.kube
