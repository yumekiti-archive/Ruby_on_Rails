dc := docker-compose -f ./docker/docker-compose.yml

.PHONY: up
up:
	$(dc) up -d --build
	bash ./docker/mysql/sql.sh

.PHONY: down
down:
	$(dc) down

.PHONY: restart
restart:
	make down
	make up

.PHONY: rm
rm:
	$(dc) down --rmi all

.PHONY: logs
logs:
	$(dc) logs -f

.PHONY: mysql
mysql:
	$(dc) exec mysql /bin/sh

.PHONY: rails
rails:
	$(dc) exec rails /bin/sh