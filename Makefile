setup:
	@make build
	@make up
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec php_docker bash -c "composer update"
data:
	docker exec php_docker bash -c "php artisan migrate"
	docker exec php_docker bash -c "php artisan db:seed"

websocket:
	docker exec php_docker bash -c "php artisan websocket:serve"

restart:
	docker exec nginx_docker nginx -s reload

# docker exec -it php_docker /bin/bash