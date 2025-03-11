#!/bin/bash

routing="prefix-cache-and-load"

request="I like apple"
/Users/bytedance/projects/bin/curl_one_request.sh "$request" "$routing"
sleep 3

request="I like orange very much"
/Users/bytedance/projects/bin/curl_one_request.sh "$request" "$routing"
sleep 3

request="I like orange"
/Users/bytedance/projects/bin/curl_one_request.sh "$request" "$routing"
sleep 3

request="I am tired. The system is too fragile and not tested"
sleep 3

request="Do you like apple?"
/Users/bytedance/projects/bin/curl_one_request.sh "$request" "$routing"
