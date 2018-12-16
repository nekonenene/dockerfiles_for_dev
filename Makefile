PREZTO_IMAGE_NAME := prezto_01
CACHE := yes

ifeq ($(CACHE), yes)
	PARAM_NO_CACHE :=
else
	PARAM_NO_CACHE := --no-cache
endif

.PHONY: build_prezto
build_prezto:
	cd prezto && \
		docker build ./ \
			$(PARAM_NO_CACHE) \
			-t prezto:latest

.PHONY: run_prezto
run_prezto:
	docker run \
		-d \
		--name $(PREZTO_IMAGE_NAME) \
		-i -t \
		prezto:latest

.PHONY: login_prezto
# -it means --interactive --tty
login_prezto:
	docker exec -it \
		--workdir /root \
		$(PREZTO_IMAGE_NAME) zsh

.PHONY: stop_prezto
stop_prezto:
	docker stop $(PREZTO_IMAGE_NAME)

.PHONY: rm_prezto
rm_prezto:
	docker rm $(PREZTO_IMAGE_NAME)
