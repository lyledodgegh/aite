#!/bin/bash

# GitHub Copilot CLI Installation/Update Script
# This script installs or updates the latest GitHub Copilot CLI

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on WSL
if ! grep -q Microsoft /proc/version; then
    print_warning "This script is designed for WSL environments"
fi

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    print_status "GitHub Copilot CLI not installed. Installing via instructions at https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian"
    (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
fi

# Check if Copilot extension is already installed
if gh extension list | grep -q "github/gh-copilot"; then
    print_status "GitHub Copilot CLI extension found. Updating..."
    gh extension upgrade gh-copilot
    print_status "GitHub Copilot CLI extension updated successfully!"
else
    print_status "Installing GitHub Copilot CLI extension..."
    gh extension install github/gh-copilot
    print_status "GitHub Copilot CLI extension installed successfully!"
fi

# Verify installation
if gh copilot --version &> /dev/null; then
    print_status "Installation verified. GitHub Copilot CLI is ready to use!"
    echo ""
    echo "Usage examples:"
    echo "  gh copilot suggest 'list files in current directory'"
    echo "  gh copilot explain 'docker run -it ubuntu'"
else
    print_error "Installation verification failed"
    exit 1
fi

# Check if Node.js is installed and update/install latest version
print_status "Checking Node.js installation..."

if command -v node &> /dev/null; then
    current_version=$(node --version)
    print_status "Node.js $current_version is currently installed"
    
    # Check if NodeSource repository is already added
    if ! apt-cache policy | grep -q "nodesource"; then
        print_status "Adding NodeSource repository for latest Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    fi
    
    print_status "Updating Node.js to latest version..."
    sudo apt update && sudo apt install nodejs -y
    
    new_version=$(node --version)
    print_status "Node.js updated to $new_version"
else
    print_status "Node.js not found. Installing latest version..."
    
    # Install Node.js from NodeSource repository for latest version
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt update && sudo apt install nodejs -y
    
    version=$(node --version)
    print_status "Node.js $version installed successfully!"
fi

# Verify installation
if node --version &> /dev/null && npm --version &> /dev/null; then
    print_status "Node.js and npm are ready to use!"
    echo "  Node.js version: $(node --version)"
    echo "  npm version: $(npm --version)"
else
    print_error "Node.js installation verification failed"
    exit 1
fi


# Check if Copilot CLI is installed
print_status "Checking GitHub Copilot CLI installation..."

if ! command -v copilot &> /dev/null; then
    print_status "GitHub Copilot CLI not installed"
    
    sudo npm install -g @github/copilot
else
    print_status "GitHub Copilot CLI is installed"
fi


# Check if Microsoft LTS OpenJDK is installed
print_status "Checking Microsoft LTS OpenJDK installation..."

if command -v java &> /dev/null; then
    current_java_version=$(java -version 2>&1 | head -n 1)
    print_status "Java is currently installed: $current_java_version"
    
    # Check if it's Microsoft's OpenJDK
    if java -version 2>&1 | grep -q "Microsoft"; then
        print_status "Microsoft OpenJDK is already installed"
    else
        print_warning "Java is installed but not Microsoft OpenJDK. Installing Microsoft LTS OpenJDK..."
        sudo apt update && sudo apt install msopenjdk-21 -y
        print_status "Microsoft LTS OpenJDK installed successfully!"
    fi
else
    print_status "Java not found. Installing Microsoft LTS OpenJDK..."
    sudo apt update && sudo apt install msopenjdk-21 -y
    print_status "Microsoft LTS OpenJDK installed successfully!"
fi

# Verify Java installation
if java -version &> /dev/null; then
    print_status "Java is ready to use!"
    java -version
else
    print_error "Java installation verification failed"
    exit 1
fi


# Check if Docker is installed
print_status "Checking Docker installation..."

if command -v docker &> /dev/null; then
    docker_version=$(docker --version)
    print_status "Docker is installed: $docker_version"
else
    print_status "Docker not found. Installing Docker..."
    sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
    
    # Add current user to docker group
    sudo usermod -aG docker $USER
    print_status "Docker installed successfully!"
    print_warning "Please log out and log back in for group membership changes to take effect"
fi

# Verify Docker installation
if docker --version &> /dev/null; then
    print_status "Docker is ready to use!"
    docker --version
else
    print_error "Docker installation verification failed"
    exit 1
fi


# Check if Claude Code CLI is installed
print_status "Checking Claude Code CLI installation..."

if command -v claude &> /dev/null; then
    claude_version=$(claude --version 2>&1)
    print_status "Claude Code CLI is installed: $claude_version"
else
    print_status "Claude Code CLI not found. Installing..."
    curl -fsSL https://claude.ai/install.sh | bash -s latest
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
    print_status "Claude Code CLI installed successfully!"
fi

# Verify Claude Code installation
if command -v claude &> /dev/null; then
    print_status "Claude Code CLI is ready to use!"
    claude --version
else
    print_error "Claude Code CLI installation verification failed"
    exit 1
fi

