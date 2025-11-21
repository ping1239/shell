#!/bin/bash

# 인자가 2개 이상인지 검사
if [ "$#" -lt 2 ]; then
    echo "인자를 2개 이상 입력하시오: $0 arg1 arg2 [arg3 ...]"
    exit 1
fi

echo ">> ex3-6.py를 실행합니다."
echo ">> 전달 인자: $@"

# 현재 디렉토리에 있는 ex3-6.py를 python3로 실행
python3 ./ex3-6.py "$@"
