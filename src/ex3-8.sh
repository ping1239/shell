#!/bin/bash

# 1) DB 폴더 확인 및 생성
if [ -d "DB" ]; then
    echo ">> DB 폴더가 이미 존재합니다."
else
    echo ">> DB 폴더가 없어 새로 생성합니다."
    mkdir DB
fi

# 2) DB 폴더 안에서 임의의 5개 파일 생성
echo ">> DB 폴더 안에 5개의 파일을 생성합니다."
for i in 1 2 3 4 5; do
    file="DB/file${i}.txt"
    echo "This is file ${i}" > "$file"
    echo "  생성: $file"
done

# 3) DB 폴더의 파일들을 압축
echo ">> DB 폴더의 파일들을 db.tar.gz로 압축합니다."
tar -czf db_files.tar.gz -C DB .

# 4) train 폴더 생성
if [ -d "train" ]; then
    echo ">> train 폴더가 이미 존재합니다."
else
    echo ">> train 폴더를 새로 생성합니다."
    mkdir train
fi

# 5) 링크하여 접근 가능하도록 하는 셸
echo ">> train 폴더 안에 DB 파일들에 대한 링크를 생성합니다."
for i in 1 2 3 4 5; do
    src="../DB/file${i}.txt"
    dest="train/file${i}.txt"
    ln -sf "$src" "$dest"
    echo "  링크: $dest -> $src"
done

echo ">> ex3-8.sh 작업 완료."
