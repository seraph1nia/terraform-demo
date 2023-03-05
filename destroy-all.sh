#!/bin/bash

# Voer dit uit om snel alle resources te destroyen
# LET OP: neemt niet cd cdktf directory mee
# Controleer zelf het eindresultaat. De enige resources die geld kosten zijn de ec2 instances.

dirs="$(find . -name "*.tf" -exec dirname {} \; | sort -u)"

IFS=$'\n'
for dir in ${dirs}; do

    terraform -chdir=${dir} init
    terraform -chdir=${dir} fmt
    for space in $(terraform workspace  list | sed -e 's/^\*//g' -e 's/ *//g'); do
        echo "Destroying workspace ${space} in directory ${dir}"
        terraform -chdir=${dir} workspace select ${space}
        terraform -chdir=${dir} destroy --auto-approve || true & 
    done
done