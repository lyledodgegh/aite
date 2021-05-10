touch .hushlogin
sudo apt-get update && sudo apt-get -y upgrade

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

sudo apt-get -y install python3 python3-pip ipython3
pip3 install jmespath-terminal

wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
rm go1.16.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubelet kubeadm

wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx
chmod +x kubectx && sudo mv kubectx /usr/local/bin/
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens
chmod +x kubens && sudo mv kubens /usr/local/bin/

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.10.0/kind-linux-amd64
chmod +x ./kind && sudo mv ./kind /usr/local/bin/
