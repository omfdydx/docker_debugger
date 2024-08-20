![visitors](https://visitor-badge.laobi.icu/badge?page_id=omfdydx.docker_debugger)

Lightweight Docker utility for curl, wget, ping, screen, psql, mysql, et al

Packed with a simple api server to keep it even if there are some scripts up and running in screen or bash


## Usage
`docker run -it -d -p 5050:5050 omfdy/docker-debugger:latest`

#### To join on particular network

`docker run -it -d -p 5050:5050 --network <network>  omfdy/docker-debugger:latest`

**Check** `curl localhost:5050`
**_Response_** `Hello World!`

To use this tool, simply run the container. The _**simple**_ flask server will keep it running. 
You can then use the various CLI tools to test your network and services.

```
* screen
* curl
* mongodb-tools
* wget
* redis
* ping
* jq
* flask
* nano
* vim
* postgresql-client
* bash
* nmap
* socat 
* netcat-openbsd 
* openssh 
* bash-completion
* kafkacat
* telnet
```

WIP - will keep including tools further needed for debugging Kubernetes / Docker based deployments

`docker buildx  build -t omfdy/docker-debugger:latest --attest type=provenance,mode=max --sbom=true .`

`docker push <image>:<tag>`
