# Use a base image specifically for amd64 architecture
FROM python:3.8-slim-bullseye

# Install Git
RUN apt-get update && \
    apt-get install -y git && \

    # Install build essentials and required dependencies
    apt-get install -y build-essential gcc && \
    apt-get install -y python3-dev && \

    # Install system packages required for matplotlib and FreeType2
    apt-get install -y libfreetype6-dev pkg-config && \
    
    # Install necessary system libraries
    apt-get install -y libgl1-mesa-glx

WORKDIR /app

COPY . /app

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 9000

CMD ["python", "app.py"]