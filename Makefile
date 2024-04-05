SHELL = /bin/bash
### https://makefiletutorial.com/

dc:= docker compose -f docker-compose.yml

up:
	$(dc) up -d

down:
	$(dc) down

up-force:
	$(dc) up --force-recreate --build --remove-orphans --no-deps

logs:
	$(dc) logs --tail=30 --follow

sh:
	$(dc) logs --tail=30 --follow


run-dev:
	docker run -it --env-file .env -v $(PWD)/src:/app -w /app node:21-alpine sh
