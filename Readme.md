![visitors](https://visitor-badge.laobi.icu/badge?page_id=omfdydx.docker_debugger)

Lightweight Docker utility for curl, wget, ping, screen, psql, mysql, et al

Packed with a simple api server to keep it running even if you come out of the container. Long time taking tasks like 
<backup or restore> kind of tasks can be achieved using this utility even if you come out of the container  


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

# Using as Kubernetes debugging tool

`kubectl run --rm utils -it --image omfdy/docker-debugger bash`

#### You will be seeing a bash prompt - 
###### __*e.g*__
$redis-cli -h hostname -p port PING
>PONG

$ psql -h hostname -U user -d database

$ ping <internal.service.name>

$ screen -S __screen_name__

$ mongodump <options> <connection-string>
