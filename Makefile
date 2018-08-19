default:
	@echo "building Local API .."
	docker build -f cmd/api/Dockerfile -t api .

up: default
	@echo "starting api locally .."
	docker-compose -f docker-compose.yml -p go-api up -d

logs:
	docker-compose -f docker-compose.yml -p go-api logs -f

down:
	docker-compose -f docker-compose.yml -p go-api down

test:
	go test -v -cover ./...

clean: down
	@echo "cleaning up .."
	rm -f api
	# docker system prune -f
	# docker volume prune -f
