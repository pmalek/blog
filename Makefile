
.PHONY: run
run:
	hugo server --buildDrafts --disableFastRender

BASE_URL ?= blog.pmalek.dev

.PHONY: build
build:
	hugo build --minify --gc --baseURL=$(BASE_URL)
