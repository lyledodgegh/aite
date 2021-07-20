# Setting up a WSL based Azure Developer Machine

## Install and update WSL 2 on Windows 10

- If you're doing this in a Hyper-V VM, on the host enable nested Hyper-V
  - `Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true`
- [Windows Subsystem for Linux Installation Guide for Windows 10 (docs.microsoft.com)](https://docs.microsoft.com/windows/wsl/install-win10)

## Tooling Setup

- `sudo apt install azure-cli`
- `sudo apt install golang-go`
- `sudo apt install python3-pip`
- `pip3 install jmespath-terminal`
- `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx`
- `chmod +x kubectx && sudo mv kubectx /usr/local/bin/`
- `wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens`
- `chmod +x kubens && sudo mv kubens /usr/local/bin/`
- `curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64`
- `chmod +x ./kind && sudo mv ./kind /usr/local/bin/`
- `curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3`
- `chmod 700 get_helm.sh`
- `./get_helm.sh`

## Docker Setup

- [Download Docker Desktop](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe)
  - You'll have to logout and log back in
  - Settings -> Resources -> WSL Integration -> Enable Ubuntu
  - Settings -> Kubernetes -> Enable Kubernetes
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
