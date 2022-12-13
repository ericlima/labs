#!/bin/bash

kubectl run -i --tty --image kubedevio/ubuntu-curl ping-test --restart=Always --rm -- /bin/bash