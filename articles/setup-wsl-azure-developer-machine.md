# Setting up a WSL based Azure Developer Machine

## Install and update WSL 2 on Windows 10

- If you're doing this in a Hyper-V VM, on the host enable nested Hyper-V
  - `Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true`
- [Windows Subsystem for Linux Installation Guide for Windows 10 (docs.microsoft.com)](https://docs.microsoft.com/windows/wsl/install-win10)
  - `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
  - `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
  - `shutdown /r /t 0`
  - [wsl_update_x64.msi](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
  - `wsl --set-default-version 2`
  - Install Ubuntu from the [Microsoft Store](https://aka.ms/wslstore)
    - Once installed click Launch
    - Create a username/password (ideally not the same as your Windows username/password)
    - `touch .hushlogin`
    - `sudo apt-get update && sudo apt-get upgrade`.

## Install the Azure CLI in WSL2

- [Install the Azure CLI on Linux (docs.microsoft.com)](https://docs.microsoft.com/cli/azure/install-azure-cli-linux)
  - The short version:
    - `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

## Install Python3, pip3, jpterm

- `sudo apt-get install python3 python3-pip ipython3`
- `pip3 install jmespath-terminal`

## Install Kubernetes + Container Tooling

- [Docker Desktop](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe)
  - You'll have to logout and log back in
  - Settings -> Resources -> WSL Integration -> Enable Ubuntu
  - Settings -> Kubernetes -> Enable Kubernetes
  - Settings -> Kubernetes -> Show system containers (advanced)
  - Click Apply & Restart, click ok on the install dialog
- [Go](https://golang.org/doc/install)
  - `wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz`
  - `sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz`
  - `rm go1.16.4.linux-amd64.tar.gz`
  - `export PATH=$PATH:/usr/local/go/bin`
- [Kubectl Kubelet Kubeadm](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
  - `sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg`
  - `echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list`
  - `sudo apt-get update`
  - `sudo apt-get install -y kubectl kubelet kubeadm`
- [kubectx / kubens]
  - `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx`
  - chmod +x kubectx
  - sudo mv kubectx /usr/local/bin/
  - `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens`
  - `chmod +x kubens && sudo mv kubens /usr/local/bin/`
- [Kind]
  - [Using WSL2](https://kind.sigs.k8s.io/docs/user/using-wsl2/)
    - `curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.10.0/kind-linux-amd64`
    - `chmod +x ./kind && sudo mv ./kind /usr/local/bin/`
 - [todo:Minikube](#)

## Visual Studio Code + Extensions

- [Visual Studio Code - 64 bit User Installer](https://code.visualstudio.com/docs/?dv=win64user)
- [Visual Studio Code - Marketplace Extensions](https://marketplace.visualstudio.com/vscode)
  - [Brackets Extension Pack for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.brackets-pack)
  - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  - [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
  - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
  - [YAML by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)

## Visual Studio Community 2019

- [Visual Studio Community 2019](https://visualstudio.microsoft.com/vs/community/)

## Handy Links

- [Collection of handy Azure CLI and Bash scripts](https://pascalnaber.wordpress.com/2020/01/10/collection-of-handy-azure-cli-and-bash-scripts/)