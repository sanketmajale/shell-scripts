DOCKER_COMPOSE := docker-compose

OS := $(shell uname)

clone:
	echo "clonning code from github"
	git clone https://github.com/sanketmajale/two-tier-flask-app.git

build:
	echo "Running in $(OS)"
	cd two-tier-flask-app && $(DOCKER_COMPOSE) build

up:
	cd two-tier-flask-app && $(DOCKER_COMPOSE) up -d

down:
	cd two-tier-flask-app && $(DOCKER_COMPOSE) down

clean:
	rm -rf two-tier-flask-app	
	docker system prune
	
	
	
	
