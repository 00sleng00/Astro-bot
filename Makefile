SHELL = /bin/bash
### https://makefiletutorial.com/

dc:= docker compose -f docker-compose.yml

deploy: git-up up-force
	@echo '🚀 Astro-bot success deploy'

git-up:
	@git checkout main
	@git pull

up:
	$(dc) up -d

down:
	$(dc) down

up-force:
	@$(dc) up -d --force-recreate --build --remove-orphans --no-deps

logs:
	$(dc) logs --tail=30 --follow

sh:
	$(dc) exec node sh

# Запуск контейнера для локальной разработки
run-dev:
	docker run -it --env-file .env -v $(PWD)/src:/app -w /app node:21-alpine sh
