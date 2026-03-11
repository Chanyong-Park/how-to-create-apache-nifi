FROM apache/nifi:latest

USER root

# 1. 필수 패키지 및 Chrome 브라우저 설치
RUN apt-get update && apt-get install -y \
    python3-pip \
    wget \
    gnupg \
    unzip \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable

# 2. 파이썬 크롤링 라이브러리 설치
RUN pip3 install requests beautifulsoup4 selenium webdriver-manager

# 3. nifi 사용자로 복구 및 작업 디렉토리 권한 설정
RUN mkdir -p /opt/nifi/nifi-current/my-scripts && chown nifi:nifi /opt/nifi/nifi-current/my-scripts
USER nifi
