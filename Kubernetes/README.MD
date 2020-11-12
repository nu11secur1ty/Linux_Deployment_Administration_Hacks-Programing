Prerequesites:
-------------
Hardware requirement:
2 CPU and 2 GB RAM

1. Set hostname and update /etc/host file for local name resolution.
hostnamectl set-hostname kube-master


2. Disable swap.
vi /etc/fstab
swapoff -a

3. Add firewall rules for kubernetes service endpoint & kubelet.
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=10250/tcp

4. Letting iptables see bridged traffic.
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

5. Add kubnenetes repository.
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

6. Set SElinux to enforcing mode.
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config


7. Install yum utility.
yum install -y yum-utils device-mapper-persistent-data lvm2

8. Add Docker repository and and install docker
yum-config-manager --add-repo   https://download.docker.com/linux/centos/docker-ce.repo
yum update -y && yum install containerd.io docker-ce docker-ce-cli


9. Create a overlay2 docker configuration file.
mkdir /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

10. Add docker to systemd.
mkdir -p /etc/systemd/system/docker.service.d
systemctl daemon-reload
systemctl restart docker
systemctl enable docker 


11. Install kubeadm and other important packages.

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable --now kubelet
======================================================================================
kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=192.168.99.112
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

yum install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc