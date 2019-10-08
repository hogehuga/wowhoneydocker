# WOWHoneypot on Dokcer
This repository runs WOWHoneypot with Docker.

- WOWHoneypot
  - https://github.com/morihisa/WOWHoneypot

# file tree

- Dockerfile
  - Dockefile for wowhoneypot docker image 
- README.md
  - This file.
- setup-wow.sh
  - docker image set up and docker run script.
  - once use.
- start-wow.sh
  - wowhoneypot start script for Docker image.
 - if not exec `docker build`, This is not necessary.

# Usage

## Easy way for novice

1. Prepare an environment where Docker can be used.
2. git pull this repository
  - `$ git pull https://github.com/hogehuga/wowhoneydocker`
3. Edit environment
  - `$ cd wowhoneydocker`
  - `$ vi setup-wow.sh`
    - NATPORT (default:8080)
    - LOGDIR (default:~logs)
    - CONTAINERNAME (default:wowhoney)
4. Setup and start wowhoneypot
  - `$ ./setup-wow.sh`
    - wowhoneypot container will running.

## Intermediate

1. Prepare an environment where Docker can be used.
2. git pull this repository
  - `$ git pull https://github.com/hogehuga/wowhoneydocker`
3. Make docker image
  - `$ cd wowhoneydocker`
  - `$ docker image build -t wowdocker ./`
4. Edit setup-wow.sh
  - remove `docker pull wowdocker` section.
  - modify NATPORT/LOGDIR/CONTAINERNAME .
5. Setup and start wowhoneypot
  - `$ ./setup-wow.sh`
    - wowhoneypot container will running.

# aftere running continer

Do the same operation as a normal container.

- Stop
  - `$ docker stop wowhoney`
- Start
  - `$ docker start wowhoney`
- Analyzing log
  - Host server's `~/logs/`
    - access_log
    - hunting.log
- login
  - `$ docker exec -it wowhoney /bin/bash`
  - login as wowhoney account.

# Knowledge

- If "NATPORT" changed to 80, it will not start container.
  - In Ubuntu. Non administrator user can't open less than 1024 port.
    (`privileged ports` can access `CAP_NET_BIND_SERVICE`)
  - You SHOULD Google "CAP_NET_BIND_SERVICE" .
- I don't understand Docker.
  - Mee too!
- 

-----

Pull request are welcome.

- git repository
  - pull request
- docker image
  - report "issue"

memo for me

- modify Docker file.
- `$ docker build tag=hogehuga/wowhoney .`
- `$ docker push hogehuga/wowhoney`
