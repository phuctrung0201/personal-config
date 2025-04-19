#! /bin/bash
source ./scripts/log.sh

info "Setting up configuration..."
info "install: Install dependencies"
info "sync: Sync configuration to the repository"
info "apply: Apply configuration to the system"

# Define the configuration directories
ZED_CONFIG_DIR=./dotfiles/zed
AEROSPACE_CONFIG_DIR=./dotfiles/aerospace
GHOSTTY_CONFIG_DIR=./dotfiles/ghostty

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

    # Sync ghostty settings
    # Check if the ghostty configuration directory exists
    if [ ! -d "~/.config/ghostty" ]; then
        info "Syncing ghostty settings..."
        cp -r ~/.config/ghostty/config $GHOSTTY_CONFIG_DIR
    else
        warn "Ghostty settings directory not found. Skipping..."
    fi

    info "Syncing complete."
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

    # Install ghostty
    if ! command -v ghostty &> /dev/null; then
        info "Installing ghostty..."
        brew install --cask ghostty
    else
        warn "Ghostty is already installed. Skipping..."
    fi

    info "Installation complete."
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

    # Apply ghostty
    mkdir -p ~/.config/ghostty
    info "Applying ghostty settings..."
    cp $GHOSTTY_CONFIG_DIR/config ~/.config/ghostty/config

    info "Applying complete."
}
