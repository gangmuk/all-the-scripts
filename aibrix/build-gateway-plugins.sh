#!/bin/bash

cd /Users/bytedance/projects/aibrix && make docker-build-gateway-plugins

kubectl rollout restart deploy aibrix-gateway-plugins -n aibrix-system
