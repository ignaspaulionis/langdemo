FROM ubuntu:latest

# Install basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    build-essential \
    software-properties-common

# Install Java
RUN apt-get install -y default-jdk
RUN wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/9.1.0/mysql-connector-j-9.1.0.jar -O /usr/local/lib/mysql-connector-java.jar

# Install Python
RUN apt-get install -y python3
# Install Python, pip, and virtualenv
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Install PHP
RUN apt-get install -y php
RUN apt-get update && apt-get install -y php php-cli php-mysql

#Install node
RUN apt-get update && apt-get install -y nodejs npm

# Clear the npm cache to prevent issues with old dependencies
RUN rm -rf /app/code/js/node_modules /app/code/js/package-lock.json
RUN npm cache clean --force


# Install Go
RUN curl -fsSL https://dl.google.com/go/go1.20.6.linux-amd64.tar.gz | tar -xz -C /usr/local && \
    ln -s /usr/local/go/bin/go /usr/bin/go

# Install .NET
RUN wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh && \
    chmod +x dotnet-install.sh && ./dotnet-install.sh -c 7.0 && \
    ln -s /root/.dotnet/dotnet /usr/bin/dotnet


# Install required packages (gcc, g++, MySQL Connector/C++, and others)
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libmysqlcppconn-dev \
    wget \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy files
COPY code /app/code
COPY scripts /app/scripts

RUN chmod +x /app/scripts/java/run_java.sh
RUN chmod +x /app/scripts/python/run_python.sh
RUN chmod +x /app/scripts/php/run_php.sh
RUN chmod +x /app/scripts/javascript/run_js.sh
RUN chmod +x /app/scripts/dotnet/run_dotnet.sh
RUN chmod +x /app/scripts/go/run_go.sh
RUN chmod +x /app/scripts/cplus/run_c.sh

# Default command
CMD ["bash"]
