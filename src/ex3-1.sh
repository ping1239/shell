#!/bin/bash

# 파라미터 변수
num1=$1
num2=$2

# 정수 사칙연산
sum=$((num1 + num2))
sub=$((num1 - num2))
mul=$((num1 * num2))

# 나눗셈은 0 나누기 방지
if [ $num2 -eq 0 ]; then
    div="0으로는 나눌 수 없습니다."
else
    div=$((num1 / num2))
fi

# 결과 출력
echo "첫 번째 숫자: $num1"
echo "두 번째 숫자: $num2"
echo "----------------------"
echo "덧셈: $sum"
echo "뺄셈: $sub"
echo "곱셈: $mul"
echo "나눗셈: $div"
