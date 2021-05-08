# Setting up a WSL based Azure Developer Machine

## High Level Tasks

- WSL2
- Update Linux
- Azure CLI
- JMESPath / Python etc
- Docker / Kind
- Visual Studio Code
- Visual Studio Code Extensions
- Handy Links

## Install and update WSL 2 on Windows 10

- [Windows Subsystem for Linux Installation Guide for Windows 10 (docs.microsoft.com)](https://docs.microsoft.com/windows/wsl/install-win10)
    - Make sure your wsl distro is running WSL2. In Windows, `wsl -l -v` should have the output VERSION being 2 for the distro you're going to use.
    - Make sure your wsl distro is up to date. If you're running Ubuntu, do a `sudo apt-get update && sudo apt-get upgrade`.

## Install the Azure CLI in WSL2

- [Install the Azure CLI on Linux (docs.microsoft.com)](https://docs.microsoft.com/cli/azure/install-azure-cli-linux)
    - If you're running on Ubuntu, the quick version is `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

## Install Python3, pip3, jpterm

- 

## x

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