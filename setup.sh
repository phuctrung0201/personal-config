#! /bin/bash
source ./scripts/log.sh

info "Setting up configuration..."
info "sync: Sync configuration to the repository"
info "apply: Apply configuration to the system"

# Define the configuration directories
ZED_CONFIG_DIR=./dotfiles/zed
AEROSPACE_CONFIG_DIR=./dotfiles/aerospace

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

    # Sync aerospace settings
    # Check if the aerospace configuration file exists
    if [ ! -f "~/.aerospace.toml" ]; then
        info "Syncing aerospace settings..."
        cp ~/.aerospace.toml $AEROSPACE_CONFIG_DIR/aerospace.toml
    else
        warn "Aerospace settings file not found. Skipping..."
    fi

    info "Syncing complete."
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

    # Apply aerospace settings
    # Check if the aerospace configuration file exists
    if [ -f "$AEROSPACE_CONFIG_DIR/aerospace.toml" ]; then
        info "Applying aerospace settings..."
        cp $AEROSPACE_CONFIG_DIR/aerospace.toml ~/.aerospace.toml
    else
        warn "Aerospace settings file not found. Skipping..."
    fi

    info "Applying complete."
}
