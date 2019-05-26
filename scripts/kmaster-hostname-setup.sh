apt-get update
swapoff -a
echo "10.1.3.64 kmaster " >> /etc/hosts
echo "10.1.3.18 knode " >> /etc/hosts
hostnamectl set-hostname kmaster
