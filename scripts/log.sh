#! /bin/bash

info() {
    echo "\033[32m[INFO] $@\033[0m"
}

warn() {
    echo "\033[33m[WARN] $@\033[0m"
}

error() {
    echo "\033[31m[ERROR] $@\033[0m"
}
