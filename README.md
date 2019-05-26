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
