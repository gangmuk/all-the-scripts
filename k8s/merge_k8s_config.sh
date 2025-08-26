#!/bin/bash

path_to_new_kubeconfig=$1

if [ -z "$path_to_new_kubeconfig" ]; then
    echo "Usage: $0 <path_to_new_kubeconfig>"
    exit 1
fi

# 1. Backup your current config
cp ~/.kube/config ~/.kube/config.backup

# 2. Temporarily set KUBECONFIG to include both configs
export KUBECONFIG=~/.kube/config:${path_to_new_kubeconfig}

# 3. View the merged config to verify it looks correct
kubectl config view

# 4. Merge and save the combined config
kubectl config view --flatten > ~/.kube/config.merged

# 5. Replace your original config with the merged one
mv ~/.kube/config.merged ~/.kube/config

# 6. Clean up the environment variable
unset KUBECONFIG
