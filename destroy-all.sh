#!/bin/bash


# zoek alle directories

dirs="$(find . -name "*.tf" -exec dirname {} \; | sort -u)"


IFS=$'\n'
for dir in ${dirs}; do


    terraform -chdir=${dir} destroy --auto-approve 2> /dev/null & || true

done