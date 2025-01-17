#!/bin/bash

zip -r wappalyzer-next.zip .
# docker compose up -d
docker build -t wappalyzer:latest .
rm wappalyzer-next.zip