# 기본 이미지로 python 3.9 사용
FROM python:3.9

# 패키지 목록을 업데이트하고 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    && pip3 install --no-cache-dir fastapi==0.110.3 \
    && pip3 install --no-cache-dir 'uvicorn[standard]'

# 애플리케이션 소스 코드를 이미지로 복사
COPY . /app

# 작업 디렉터리 설정
WORKDIR /app

ENV STUDENT_ID="2020314014"

# 컨테이너 시작 시 실행할 명령어 설정
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

