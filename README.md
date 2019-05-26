#   K8s-master host setup

wget https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/kmaster-hostname-setup.sh

#  change the host names and IP-addresses according to your environement

vim kmaster-hostname-setup.sh

chmod +x kmaster-hostname-setup.sh

sh kmaster-hostname-setup.sh

----------------------------------------------------------------------------------------------------

# k8s-node host setup

wget https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/knode-hostname-setup.sh

#  change the host names and IP-addresses according to your environement

vim knode-hostname-setup.sh

chmod +x knode-hostname-setup.sh

sh knode-hostname-setup.sh

----------------------------------------------------------------------------------------------------

#  Docker installtion

apt-get update

apt-get install curl 

# installing docker using shell script

bash <(curl -Ls https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/docker-install.sh)

-----------------------------------------------------------------------------------------------------

# Kubernetes installtion 

bash <(curl -Ls https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/kubernetes-installation.sh)

-----------------------------------------------------------------------------------------------------

# Kmaster setup 

# Run as noraml user from now and user must have sudo access 

wget https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/kmaster-pod-network.sh

# Modify the kmaster ip in below file (kmaster-pod-network.sh)

vim kmaster-pod-network.sh

sh kmaster-pod-network.sh

# make sure all services including coredns and calico network services are running 

kubectl get pods -o wide --all-namespaces

--------------------------------------------------------------------------------------------------------

# Knode join setup

# Run the below command in Kmaster and get the join-token and paste in the knode machine

kubeadm token create --print-join-command 

# Finally verify whether the knode joined in the kmaster cluster by using below command

kubectl get nodes

--------------------------------------------------------------------------------------------------------

# Installing the Dashboard in kmaster 

bash <(curl -Ls https://raw.githubusercontent.com/ypmn/ypmn-k8s/master/scripts/kubernetes-dashboard.sh)

#check the list of secrets tokens 

kubectl get secrets

#display the dasboard existing token  

Ex : kubectl describe secrets/dashboard-token-zgphz


