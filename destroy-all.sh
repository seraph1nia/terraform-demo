#!/bin/bash


# zoek alle directories

dirs="$(find . -name "*.tf" -exec dirname {} \; | sort -u)"


IFS=$'\n'
for dir in ${dirs}; do

    terraform -chdir=${dir} fmt
    terraform -chdir=${dir} destroy --auto-approve || true & 

done