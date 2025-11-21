#!/bin/bash

# 사용자에게 여러 개의 x 값 입력받기
echo "x 값을 여러 개 입력하세요: "
read -a xs   # 배열로 입력받기

echo "-------------------------"
echo "y = (1/2) * x^2 계산 결과"
echo "-------------------------"

# 모든 입력값에 대해 계산 수행
for x in "${xs[@]}"; do
    # bc 처리용 식 만들기
    formula="0.5 * ($x * $x)"
    y=$(echo "$formula" | bc -l)

    echo "y = $y"
done
