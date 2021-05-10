# Setting up a WSL based Azure Developer Machine

- JMESPath / Python etc
- Install Kubernetes Tooling
- Visual Studio Code
- Visual Studio Code Extensions
- Handy Links

## Install and update WSL 2 on Windows 10

If you're running all of this from within a virtual machine using Hyper-V, make sure [enable nested virtualization (docs.microsoft.com)](https://docs.microsoft.com/virtualization/hyper-v-on-windows/user-guide/nested-virtualization#configure-nested-virtualization).

- [Windows Subsystem for Linux Installation Guide for Windows 10 (docs.microsoft.com)](https://docs.microsoft.com/windows/wsl/install-win10)
    - The short version (run the windows commands as admin)
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

These are useful for other tools, as well as for running jpterm to get your `-o tsv' paths right when writing scripts
- `sudo apt-get install python3 python3-pip ipython3`
- `pip3 install jmespath-terminal`

## Install Kubernetes Tooling

- [Go](https://golang.org/doc/install)
    - `wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz`
    - `sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz`
    - `export PATH=$PATH:/usr/local/go/bin`
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
    - `sudo apt-get update`
    - `sudo apt-get install -y apt-transport-https ca-certificates curl`
    - `sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg`
    - `echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list`
    - `sudo apt-get update`
    - `sudo apt-get install -y kubectl`
- [Kind]
    - [Using WSL2](https://kind.sigs.k8s.io/docs/user/using-wsl2/)
- [kubectx / kubens]
- kubeadm
- kind or minikube

## x

## x

## Visual Studio Code Extensions

- [Visual Studio Code on the Visual Studio Marketplace](https://marketplace.visualstudio.com/vscode)
    - [Brackets Extension Pack for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.brackets-pack)
    - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
    - [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
    - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
    - [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
    - [YAML by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)

## Handy Links

- [Collection of handy Azure CLI and Bash scripts](https://pascalnaber.wordpress.com/2020/01/10/collection-of-handy-azure-cli-and-bash-scripts/)