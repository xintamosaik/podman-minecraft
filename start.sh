#!/bin/bash

echo "Starting Minecraft Server..."
podman play kube podman-minecraft.yaml

echo "Server is now running!"