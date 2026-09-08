FROM python:3.12-alpine

WORKDIR /tmp

COPY app.py requirements.txt index.html ./

EXPOSE 3000

RUN apk update && apk --no-cache add openssl bash curl &&\
    apk --no-cache add --virtual .build-deps gcc musl-dev linux-headers python3-dev &&\
    chmod +x app.py &&\
    pip install -r requirements.txt &&\
    apk del .build-deps
    
CMD ["python3", "app.py"]
