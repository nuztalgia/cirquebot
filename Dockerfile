FROM python:3

RUN apt-get update && \
  apt-get install -y ffmpeg && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
VOLUME /usr/src/app/data

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "./main.py", "DEV"]
