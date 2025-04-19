#! /bin/bash
source ./scripts/log.sh

info "Setting up configuration..."
info "install: Install dependencies"
info "sync: Sync configuration to the repository"
info "apply: Apply configuration to the system"

# Define the configuration directories
ZED_CONFIG_DIR=./dotfiles/zed

# Sync configuration to the repository
sync () {
    info "Syncing configuration to the repository..."

    # Sync zed key bindings
    # Check if the zed configuration directory exists
    if [ ! -f "~/.config/zed/keymap.json" ]; then
        info "Syncing zed key bindings..."
        cp ~/.config/zed/keymap.json $ZED_CONFIG_DIR/keymap.json
    else
        warn "Zed key bindings file not found. Skipping..."
    fi

    # Sync zed settings
    # Check if the zed configuration directory exists
    if [ ! -f "~/.config/zed/settings.json" ]; then
        info "Syncing zed settings..."
        cp ~/.config/zed/settings.json $ZED_CONFIG_DIR/settings.json
    else
        warn "Zed settings file not found. Skipping..."
    fi
}

# Install applications
install () {
    info "Installing applications..."

    # Install zed
    if ! command -v zed &> /dev/null; then
        info "Installing zed..."
        brew install --cask zed
    else
        warn "Zed is already installed. Skipping..."
    fi
}

# Apply the configuration to the system
apply () {
    info "Applying configuration to the system..."

    # Apply zed key bindings
    # Check if the zed configuration directory exists
    if [ -f "$ZED_CONFIG_DIR/keymap.json" ]; then
        info "Applying zed key bindings..."
        cp $ZED_CONFIG_DIR/keymap.json ~/.config/zed/keymap.json
    else
        warn "Zed key bindings file not found. Skipping..."
    fi

    # Apply zed settings
    # Check if the zed configuration directory exists
    if [ -f "$ZED_CONFIG_DIR/settings.json" ]; then
        info "Applying zed settings..."
        cp $ZED_CONFIG_DIR/settings.json ~/.config/zed/settings.json
    else
        warn "Zed settings file not found. Skipping..."
    fi
}
