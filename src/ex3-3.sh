#!/bin/bash

# 점수들 입력받기
echo "과목 점수들을 입력하세요: "
read -a scores   # 배열로 입력받기

echo "---------------------------"
echo "각 과목 등급 출력"
echo "---------------------------"

total=0
count=0
a_count=0

for s in "${scores[@]}"; do
    # 0~100 범위 체크
    if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
        echo "점수 $s 은(는) 잘못된 값입니다 (0~100 입력)."
        exit 1
    fi

    # 등급 계산
    if [ "$s" -ge 90 ]; then
        grade="A"
        a_count=$((a_count + 1))
    else
        grade="B"
    fi

    echo "점수: $s - 등급: $grade"

    total=$((total + s))
    count=$((count + 1))
done

echo "---------------------------"
echo "평균 등급 계산"
echo "---------------------------"

# 평균 산출
avg=$(( total / count ))

# 평균 등급
if [ "$avg" -ge 90 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"
