# Base image
FROM python:3.9-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*  

# Work dir
WORKDIR /app

# Copy
COPY . .

# Run 
RUN 	pip install --upgrade pip \ 
	&& pip install mysqlclient \ 
	&& pip install mysql-connector \
	&& pip install -r requirements.txt
 
# Exec 
CMD ["python","app.py"]
