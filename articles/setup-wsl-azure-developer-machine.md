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
    - `sudo apt-get update && sudo apt-get -y upgrade`.

## Install all of the tooling in Linux

If you're brave, you can do this whole section by doing the command below, otherwise walk through teach subsection

  `curl -sL https://raw.githubusercontent.com/lyledodgegh/aite/main/articles/setup-wsl-azure-developer-machine-bash-all-in-one.md | sudo bash`

- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli-linux)
  - `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`
- Python3, pip3, jpterm
  - `sudo apt-get -y install python3 python3-pip ipython3`
  - `pip3 install jmespath-terminal`
- [Go](https://golang.org/doc/install)
  - `wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz`
  - `sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz`
  - `rm go1.16.4.linux-amd64.tar.gz`
  - `export PATH=$PATH:/usr/local/go/bin`
- [Kubectl Kubelet Kubeadm](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
  - `sudo apt-get update`
  - `sudo apt-get install -y apt-transport-https ca-certificates curl`
  - `sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg`
  - `echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list`
  - `sudo apt-get update`
  - `sudo apt-get install -y kubectl kubelet kubeadm`
  [kubectx / kubens]
  - `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx`
  - `chmod +x kubectx && sudo mv kubectx /usr/local/bin/`
  - `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens`
  - `chmod +x kubens && sudo mv kubens /usr/local/bin/`
- [Kind](https://kind.sigs.k8s.io/docs/user/using-wsl2/)
  - `curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.10.0/kind-linux-amd64`
  - `chmod +x ./kind && sudo mv ./kind /usr/local/bin/`

## Docker

- [Download Docker Desktop](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe)
  - You'll have to logout and log back in
  - Settings -> Resources -> WSL Integration -> Enable Ubuntu
  - Settings -> Kubernetes -> Enable Kubernetes
  - Settings -> Kubernetes -> Show system containers (advanced)
  - Click Apply & Restart, click ok on the install dialog


## Visual Studio Code + Extensions

- [Visual Studio Code - 64 bit User Installer](https://code.visualstudio.com/docs/?dv=win64user)
- [Visual Studio Code - Marketplace Extensions](https://marketplace.visualstudio.com/vscode)
  - [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
  - [Remote - Containers](ms-vscode-remote.remote-containers)
  - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Bridge to Kubernetes](https://marketplace.visualstudio.com/items?itemName=mindaro.mindaro)
  - [Kubernetes](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tool)
  - [YAML by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
  - [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
  - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
