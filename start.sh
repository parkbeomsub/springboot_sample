
#!/bin/bash

# 사용법: ./kill_process.sh <포트번호>
if [ -z "$1" ]; then
	  echo "사용법: $0 <포트번호>"
	    exit 1
fi

PORT=$1

# 포트에서 실행 중인 프로세스 ID 찾기
PID=$(lsof -t -i:$PORT)

if [ -z "$PID" ]; then
	  echo "포트 $PORT에서 실행 중인 프로세스가 없습니다."
#실행
          nohup java -jar build/libs/demo-0.0.1-SNAPSHOT.war &

fi

# 프로세스 종료
kill -9 $PID

echo "포트 $PORT에서 실행 중인 프로세스($PID)를 종료했습니다."



#실행
nohup java -jar build/libs/demo-0.0.1-SNAPSHOT.war &
