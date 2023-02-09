dev:
	docker-compose --env-file .env.dev -f docker-compose.dev.yml up

dev-clean:
	docker-compose -f docker-compose.dev.yml down
	docker container prune
	
test:
	docker-compose -f docker-compose.test.yml up

test-clean:
	docker-compose -f docker-compose.test.yml down
	docker container prune
	docker volume prune