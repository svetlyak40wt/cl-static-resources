#!/bin/bash

if ! [[ -e .qlot ]]; then
    qlot install
fi

qlot exec ros --eval '(asdf:make "app")'
