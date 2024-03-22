#!/bin/sh

pods_manager_command_name="docker"

function valid_podman() {
  if ! pods_manager_loc="$(type -p "$pods_manager_command_name")" || [[ -z $pods_manager_loc ]]; then
    echo "$pods_manager_command_name not found, trying with podman"
    pods_manager_command_name="podman"

    alias docker=podman
    return 0
  fi
}

valid_podman