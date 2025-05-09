alias kubectl='sudo microk8s kubectl' 

# Create the service account in the current namespace (we assume default)
kubectl create serviceaccount skooner-sa

# Give that service account root on the cluster
kubectl create clusterrolebinding skooner-sa --clusterrole=cluster-admin --serviceaccount=default:skooner-sa

# For Kubernetes v1.21 or lower
# Find the secret that was created to hold the token for the SA
kubectl get secrets

# Show the contents of the secret to extract the token
kubectl describe secret skooner-sa-token-049761

# For Kubernetes v1.22 or higher
kubectl create token skooner-sa

# kubectl delete -f ./kubernetes-skooner.yaml
# kubectl apply -f ./kubernetes-skooner.yaml
# kubectl create token skooner-sa
