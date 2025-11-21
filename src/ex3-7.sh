#!/bin/bash

while true; do
    echo "==============================="
    echo "   시스템 상태 확인 메뉴"
    echo "==============================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==============================="
    read -p "메뉴를 선택하세요 (1-5): " choice

    case "$choice" in
        1)
            echo ">> 사용자 정보"
            echo "현재 사용자: $(whoami)"
            echo "로그인 사용자 목록:"
            who
            ;;
        2)
            echo ">> GPU 또는 CPU 사용률 확인"
            if command -v nvidia-smi >/dev/null 2>&1; then
                echo "[GPU 상태 - nvidia-smi]"
                nvidia-smi
            else
                echo "[CPU 사용률 - top 상위 일부]"
                # top은 인터랙티브라서 -b -n1 옵션으로 1번만 출력
                top -b -n 1 | head -n 15
            fi
            ;;
        3)
            echo ">> 메모리 사용량 (free -h)"
            free -h
            ;;
        4)
            echo ">> 디스크 사용량 (df -h)"
            df -h
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
