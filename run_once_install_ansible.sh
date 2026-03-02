#!/bin/bash

# Define the toolbox name for consistency
TOOLBOX_NAME="ansible-control"

install_on_fedora() {
    # Check if we are on Silverblue/Kinoite (Immutable)
    if [ -f /run/ostree-booted ]; then
        echo "Detected Fedora Silverblue/Atomic. Using Toolbox..."
        
        # Create toolbox if it doesn't exist
        if ! estate=$(toolbox list -c | grep -w "$TOOLBOX_NAME"); then
            echo "Creating toolbox: $TOOLBOX_NAME"
            toolbox create -c "$TOOLBOX_NAME" -y
        fi

        # Install Ansible inside the toolbox
        echo "Installing Ansible inside $TOOLBOX_NAME..."
        toolbox run -c "$TOOLBOX_NAME" sudo dnf install -y ansible
        
        # Run the playbook inside the toolbox
        echo "Running playbook inside toolbox..."
        toolbox run -c "$TOOLBOX_NAME" ansible-playbook "$HOME/.bootstrap/setup.yml" --ask-become-pass
    else
        # Standard Fedora Workstation
        echo "Detected Fedora Workstation (Standard). Using DNF..."
        sudo dnf install -y ansible
        ansible-playbook "$HOME/.bootstrap/setup.yml" --ask-become-pass
    fi
}

install_on_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y ansible
    ansible-playbook "$HOME/.bootstrap/setup.yml" --ask-become-pass
}

install_on_mac() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install it first."
        exit 1
    fi
    brew install ansible
    ansible-playbook "$HOME/.bootstrap/setup.yml" --ask-become-pass
}

# --- Main Logic ---

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac

echo "Ansible process complete."
