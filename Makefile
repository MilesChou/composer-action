PLATFORM := linux/amd64,linux/arm64

.PHONY: all
all: 8.3

.PHONY: 8.3
8.3:
	docker build -t=ghcr.io/mileschou/composer:8.3 --progress=plain --platform=${PLATFORM} 8.3
