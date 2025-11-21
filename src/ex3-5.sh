#!/bin/bash

run_ls() {
    local cmd="ls $opts"

    echo "실행 명령: $cmd"
    eval "$cmd"
}

# 스크립트에 넘긴 인자 전체를 run_ls에 그대로 넘김
run_ls "$@"

