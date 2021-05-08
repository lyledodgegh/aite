# Setting up a WSL based Azure Developer Machine

- JMESPath / Python etc
- Install Kubernetes Tooling
- Visual Studio Code
- Visual Studio Code Extensions
- Handy Links

## Install and update WSL 2 on Windows 10

- [Windows Subsystem for Linux Installation Guide for Windows 10 (docs.microsoft.com)](https://docs.microsoft.com/windows/wsl/install-win10)
    - Make sure your wsl distro is running WSL2. In Windows, `wsl -l -v` should have the output VERSION being 2 for the distro you're going to use.
    - Make sure your wsl distro is up to date. If you're running Ubuntu, do a `sudo apt-get update && sudo apt-get upgrade`.
    - The short version (run as admin):
        - `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
        - `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
        - `shutdown /r /t 0`
        - [wsl_update_x64.msi](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
        - `wsl --set-default-version 2`
        - Pick a linux distro from the [Microsoft Store](https://aka.ms/wslstore) - this article assumes Ubuntu
            - Don't forget your username/password you created. It doesn't need to be the same as your Windows account (mine is not).

## Install the Azure CLI in WSL2

- [Install the Azure CLI on Linux (docs.microsoft.com)](https://docs.microsoft.com/cli/azure/install-azure-cli-linux)
    - The short version:
        - `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

## Install Python3, pip3, jpterm

- 

## Install Kubernetes Tooling

- [Kind]
    - [Using WSL2](https://kind.sigs.k8s.io/docs/user/using-wsl2/)
- [kubectx / kubens]

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