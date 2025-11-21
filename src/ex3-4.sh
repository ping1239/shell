 #!/bin/bash

# 점수들을 저장할 배열
scores=()

while true; do
    echo "==============================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "==============================="
    read -p "메뉴를 선택하세요 (1-5): " choice

    case "$choice" in
        1)
            # 과목 성적 추가
            read -p "추가할 점수(0~100): " s

            # 유효성 검사
            if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
                echo ">> 점수는 0~100 사이여야 합니다."
            else
                scores+=("$s")
                echo ">> 점수 $s 이(가) 추가되었습니다."
            fi
            ;;
        2)
            # 입력된 모든 점수 보기
            if [ ${#scores[@]} -eq 0 ]; then
                echo ">> 아직 입력된 점수가 없습니다."
            else
                echo ">> 입력된 점수 목록:"
                for i in "${!scores[@]}"; do
                    idx=$((i + 1))
                    echo "  과목 $idx: ${scores[$i]}"
                done
            fi
            ;;
        3)
            # 평균 점수 확인
            if [ ${#scores[@]} -eq 0 ]; then
                echo ">> 평균을 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$((total + s))
                done
                count=${#scores[@]}
                avg=$(( total / count ))
                echo ">> 과목 수: $count"
                echo ">> 평균 점수: $avg"
            fi
            ;;
        4)
            # 평균 등급(GPA) 변환
            if [ ${#scores[@]} -eq 0 ]; then
                echo ">> 평균 등급을 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$((total + s))
                done
                count=${#scores[@]}
                avg=$(( total / count ))

                if   [ "$avg" -ge 90 ]; then
                    grade="A"
                else
                    grade="B"
                fi

                echo ">> 평균 등급: $grade"
            fi
            ;;
        5)
            echo ">> 프로그램을 종료합니다."
            break
            ;;
        *)
            echo ">> 1~5 사이의 번호를 입력하세요."
            ;;
    esac

    echo    # 한 줄 띄우기
done
