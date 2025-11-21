import sys

args = sys.argv[1:]

print(f"입력된 인자 개수: {len(args)}")
print("입력된 인자 목록:")

for i, a in enumerate(args, start=1):
    print(f"  {i}번째 인자: {a}")
