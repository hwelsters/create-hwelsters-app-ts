dev-up:
	docker-compose --env-file .env.dev -f docker-compose.dev.yml up

dev-down:
	docker-compose --env-file .env.dev -f docker-compose.dev.yml down
	
test-down:
	docker-compose -f docker-compose.test.yml up

test-down:
	docker-compose -f docker-compose.test.yml down
	
clean:
	docker container prune
	docker volume prune