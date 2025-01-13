FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    firefox-esr \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz \
    && tar -xvzf geckodriver-v0.35.0-linux64.tar.gz \
    && mv geckodriver /usr/local/bin/ \
    && rm geckodriver-v0.35.0-linux64.tar.gz

# RUN pip install --no-cache-dir wappalyzer
WORKDIR /app

COPY ./wappalyzer-next.zip .
RUN unzip wappalyzer-next.zip

# WORKDIR /app/wappalyzer-next
RUN pip install --no-cache -e .

ENTRYPOINT ["wappalyzer"]
