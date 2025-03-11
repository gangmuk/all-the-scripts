#!/bin/bash

request="$1"
routing=$2

#auth_token="test-key-1234567890" # mock-app
auth_token="sk-kFJ12nKsFVfVmGpj3QzX65s4RbN2xJqWzPYCjYu7wT3BlbLi"

#model=llama2-7b # mock-app
# model=deepseek-llm-7b-chat # vke
model=qwen2-5-7b-instruct

port=8888 # you already should do port-forward 8888 (local) -> 80 (svc/envoy-aibrix-system-aibrix-eg-903790dc)
temp=0.0
max_tokens=1000

if [ -z "$routing" ]; then
    echo "routing argument is empty"
    echo "Usage: ./curl_one_request.sh <request> <routing>"
    echo "exiting..."
    exit 1
fi

if [ -z "$request" ]; then
    ## three requests
    ## 33%: I like apple
    ## 33%: I like orange
    ## 33%: I like orange very much
    probability=$(($RANDOM % 100))
    if [ $probability -le 33 ]; then
        request="I like apple"
    elif [ $probability -le 66 ]; then
        request="I like orange"
    else
        request="I like orange very much"
    fi
fi

echo $request


curl -i "http://localhost:${port}/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${auth_token}" \
    -H "routing-strategy: ${routing}" \
    -d "{
        \"model\": \"${model}\",
        \"messages\": [{\"role\": \"user\", \"content\": \"$request\"}],
        \"temperature\": ${temp},
        \"max_tokens\": ${max_tokens}
    }"
