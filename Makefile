
## -----
## Build
## -----

build-7.0-apache-buster:
	@cd 7.0/buster/apache && \
		docker build . \
			-t javanile/php:7.0-apache \
			-t javanile/php:7.0-apache-buster \
			-t javanile/php:7.0.33-apache-buster

## ----
## Push
## ----

push-7.0-apache-buster: build-7.0-apache-buster
	@docker push javanile/php:7.0-apache
	@docker push javanile/php:7.0-apache-buster
	@docker push javanile/php:7.0.33-apache-buster

## ----
## Test
## ----

test-7.0-apache-buster: build-7.0-apache-buster
	@docker run --rm javanile/php:7.0-apache-buster bash -c "cat /etc/os-release; php --version"
