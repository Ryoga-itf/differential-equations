#!/bin/bash

if [ -n "${1}" ]; then
     typst compile "${1}/report.typ" --root .
else
    for file in $(find . -type f -name '*.typ'); do
        typst compile $file --root .
    done
fi
