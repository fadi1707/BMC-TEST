FROM python:3.6-alpine

WORKDIR /app

COPY dir_scanner.py .

VOLUME ["/output"]

CMD ["python", "dir_scanner.py"]
RUN ls -latr
#COPY ./res.log /output

