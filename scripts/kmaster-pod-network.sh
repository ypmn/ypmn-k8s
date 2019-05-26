#Kmaster server pod network instalization
sudo kubeadm init --apiserver-advertise-address=10.1.3.64 --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config



kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml



kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

echo "waiting 2 mins for pod network setup "
sleep 2m

kubectl get pods -o wide --all-namespaces

