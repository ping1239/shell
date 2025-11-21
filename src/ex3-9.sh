#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
    echo ">> $DB_FILE 파일을 새로 생성했습니다."
fi

while true; do
    echo "==================="
    echo " 1) 팀원 정보 추가"
    echo " 2) 팀원과 한 일 기록"
    echo " 3) 팀원 검색"
    echo " 4) 수행 내용 검색"
    echo " 5) 종료"
    echo "==================="
    read -p "메뉴를 선택하세요 (1-5): " choice

    case "$choice" in
        1)
            echo ">> 팀원 정보 추가"
            read -p "이름: " name
            read -p "생일(또는 전화번호): " info

            # MEMBER|이름|정보 형태로 저장
            echo "MEMBER|$name|$info" >> "$DB_FILE"
            echo ">> 팀원 정보가 저장되었습니다."
            ;;

        2)
            echo ">> 팀원과 한 일 기록"
            read -p "날짜(예: 2025-11-21): " date
            read -p "팀원 이름: " name
            read -p "함께 한 일(내용): " work

            # LOG|날짜|이름|내용 형태로 저장
            echo "LOG|$date|$name|$work" >> "$DB_FILE"
            echo ">> 수행 내용이 저장되었습니다."
            ;;

        3)
            echo ">> 팀원 검색 (이름으로 검색)"
            read -p "검색할 팀원 이름: " search_name

            # 앞뒤 공백 제거
            search_name="$(echo "$search_name" | xargs)"

            echo ">> 검색 결과:"
            # 팀원 기본 정보
            grep "^MEMBER|$search_name|" "$DB_FILE" || echo ">> 해당 이름의 팀원 정보가 없습니다."
            # 그 팀원과 한 LOG 기록
            grep "^LOG|" "$DB_FILE" | grep "|$search_name|" || true
            ;;

        4)
            echo ">> 수행 내용 검색 (날짜로 검색)"
            read -p "검색할 날짜(예: 2025-11-21): " search_date

            # 앞뒤 공백 제거
            search_date="$(echo "$search_date" | xargs)"

            echo ">> 검색 결과:"
            # LOG 줄 중에서 해당 날짜가 들어간 줄을 모두 검색
            grep "^LOG|" "$DB_FILE" | grep "$search_date" || echo ">> 해당 날짜의 기록이 없습니다."
            ;;

        5)
            echo ">> 프로그램을 종료합니다."
            break
            ;;

        *)
            echo ">> 1~5 사이의 번호를 입력하세요."
            ;;
    esac

    echo
done
