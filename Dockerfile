# Use the Alpine Linux base image, which is a lightweight and compact image
FROM alpine:latest

# Set environment variables for the user and group IDs
ENV USER=utils
ENV UTILS_USER_GID=1000
ENV UTILS_USER_UID=1000

# Set the application home directory
ENV APP_HOME=/home/${USER}

# Install GoLang and set environment variables
# Install GoLang
ENV GOROOT=/usr/lib/go
ENV GOPATH=${APP_HOME}/go
ENV PATH=${APP_HOME}/go/bin:$PATH
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin
#Install GoLang

# Set the default port for the Flask application
ARG PORT=5050
ENV FLASK_RUN_PORT=${PORT}

# Install various packages and tools using apk
RUN apk add --no-cache \
  screen \
  curl \
  wget \
  redis \
  iputils-ping \
  jq \
  nano \
  vim \
  postgresql-client \
  bash \
  py3-flask \
  kafkacat \
  inetutils-telnet \
  nmap \
  socat \
  netcat-openbsd \
  openssh \
  bash-completion \
  go \
  musl-dev \
  findutils-locate \
  sudo \
  git

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Create a new user and group, and add the user to the group
RUN addgroup --gid ${UTILS_USER_GID} ${USER} && adduser --disabled-password --uid ${UTILS_USER_UID} --ingroup ${USER} ${USER} && \
  mkdir -p /etc/sudoers.d && \
  echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
  chmod 0440 /etc/sudoers.d/${USER}

# Install dependencies for building mongo-tools
RUN apk add --update --no-cache \
    gcc \
    g++ \
    make \
    curl \
    python3 \
    go \
    libc6-compat \
    krb5-pkinit \
    krb5-dev \
    krb5

# Switch to the new user
USER utils

# Set the working directory to the application home directory
WORKDIR $APP_HOME

# Clone the MongoDB Tools repository and build it
RUN git clone --branch 100.10.0 https://github.com/mongodb/mongo-tools.git && \
  cd mongo-tools && \
  ./make build && \
  sudo cp bin/* /usr/local/bin/ && \
  cd .. && \
  rm -rf mongo-tools

# Copy the current directory (i.e. the Dockerfile directory) into the container
COPY . $APP_HOME

# Expose the port for the Flask application
EXPOSE $PORT

# Set the default command to run when the container starts
CMD ["python", "server.py"]