build:
	./scripts/build

deploy:
	./scripts/deploy

publish: build
	./scripts/publish

serve:
	docker-compose build
	docker-compose run vector

test:
	docker-compose down
	docker-compose up -d --build
	./scripts/wait_for_syslog_client
	curl localhost:5000
	docker-compose logs vector | grep "local testing message"

.PHONY: build publish deploy serve
