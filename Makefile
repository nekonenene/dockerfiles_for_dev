PREZTO_CONTAINER_NAME := prezto_01
DEV_CONTAINER_NAME := hatone_dev_01
RUBY_VER := "2.5.3"

CACHE := yes

ifeq ($(CACHE), yes)
	PARAM_NO_CACHE :=
else
	PARAM_NO_CACHE := --no-cache
endif

.PHONY: all
all: build_all run_dev login_dev

.PHONY: build_all
build_all: build_prezto build_prezto_ruby build_dev

.PHONY: build_prezto
build_prezto:
	cd prezto && \
		docker build ./ \
			$(PARAM_NO_CACHE) \
			-t prezto:latest

.PHONY: build_prezto_ruby
build_prezto_ruby:
	cd ruby && \
		docker build ./ \
			$(PARAM_NO_CACHE) \
			-t prezto_ruby:latest

.PHONY: build_dev
build_dev:
	cd hatone_dev && \
		docker build ./ \
			$(PARAM_NO_CACHE) \
			--build-arg RUBY_VER="$(RUBY_VER)" \
			-t hatone_dev:latest

.PHONY: run
run:
	docker run \
		-it \
		--rm \
		--workdir /root \
		hatone_dev:latest

.PHONY: run_prezto
run_prezto:
	docker run \
		-d \
		--name $(PREZTO_CONTAINER_NAME) \
		-i -t \
		prezto:latest

.PHONY: run_dev
run_dev:
	docker run \
		-d \
		--name $(DEV_CONTAINER_NAME) \
		-i -t \
		hatone_dev:latest

.PHONY: login_prezto
# -it means --interactive --tty
login_prezto:
	docker exec -it \
		--workdir /root \
		$(PREZTO_CONTAINER_NAME) zsh

.PHONY: login_dev
login_dev:
	docker exec -it \
		--workdir /root \
		$(DEV_CONTAINER_NAME) zsh

.PHONY: clean
clean: stop_dev rm_dev

.PHONY: stop_prezto
stop_prezto:
	docker stop $(PREZTO_CONTAINER_NAME)

.PHONY: stop_dev
stop_dev:
	docker stop $(DEV_CONTAINER_NAME)

.PHONY: rm_prezto
rm_prezto:
	docker rm $(PREZTO_CONTAINER_NAME)

.PHONY: rm_dev
rm_dev:
	docker rm $(DEV_CONTAINER_NAME)
