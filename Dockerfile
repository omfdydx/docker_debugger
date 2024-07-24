FROM alpine:3.20.2
ENV USER=utils
ENV UTILS_USER_GID=1000
ENV UTILS_USER_UID=1000
ENV APP_HOME=/home/${USER}
ARG PORT=5050
ENV FLASK_RUN_PORT=${PORT}
RUN apk add --no-cache \
  screen \
  curl \
  mongodb-tools \
  wget \
  redis \
  httpie \
  iputils-ping \
  jq \
  nano \
  vim \
  postgresql-client \
  bash \
  py3-flask

RUN addgroup --gid ${UTILS_USER_GID} ${USER} && adduser --disabled-password --uid ${UTILS_USER_UID} --ingroup ${USER} ${USER}
USER utils
WORKDIR $APP_HOME

COPY . $APP_HOME
EXPOSE $PORT
CMD ["python", "server.py"]
