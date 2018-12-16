.PHONY: build_prezto
build_prezto:
	cd prezto && \
		docker build ./ -t prezto:latest

.PHONY: run_prezto
run_prezto:
	docker run \
		-d \
		--name prezto_01 \
		-i -t \
		prezto:latest

.PHONY: login_prezto
login_prezto:
	docker exec -it prezto_01 zsh

.PHONY: stop_prezto
stop_prezto:
	docker stop prezto_01

.PHONY: rm_prezto
rm_prezto:
	docker rm prezto_01
