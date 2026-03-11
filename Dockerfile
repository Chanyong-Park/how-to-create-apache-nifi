FROM apache/nifi:latest

# 루트 권한으로 전환하여 패키지 설치
USER root
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install requests beautifulsoup4 selenium

# 다시 nifi 사용자로 전환 (보안상 권장)
USER nifi
