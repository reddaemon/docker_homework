#!/bin/bash

container_name="backend"
echo $container_name
find=$(command -v find)
$find frontend/src -iname '*Api.js' -exec sed -i.bak -e "s/localhost/${container_name}/g" {} \; 