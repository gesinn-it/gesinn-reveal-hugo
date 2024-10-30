# Variables
HUGO_BIN = hugo
REVEAL_DIR = ./reveal.js
BUILD_DIR = ./public
DEMO_PORT = 1313
SHOW_LOGS = false
DOCKER_IMAGE = klakegg/hugo:ext-alpine
CONTAINER_NAME ?= hugo_reveal_server

# Functions
show-current-target = @echo; echo "======= $@ ========"

# ======== up ========

.PHONY: up
up:
	$(show-current-target)
	$(HUGO_BIN) server

# ======== docker-up ========

.PHONY: docker-up
docker-up:
	$(show-current-target)
	docker run --rm --name $(CONTAINER_NAME) -p $(DEMO_PORT):$(DEMO_PORT) -v $(shell pwd):/src $(DOCKER_IMAGE) server --bind 0.0.0.0 --baseURL http://localhost:$(DEMO_PORT) --port $(DEMO_PORT) --watch

# ======== Clean ========

.PHONY: clean
clean:
	$(show-current-target)
	rm -rf $(BUILD_DIR)

# ======== Show Logs ========

.PHONY: show-logs
show-logs:
	$(show-current-target)
	if [ "$(SHOW_LOGS)" = true ]; then \
		tail -f $(BUILD_DIR)/logs/*.log; \
	else \
		echo "Logs are disabled."; \
	fi

# ======== Help ========

.PHONY: help
help:
	@echo "Makefile for Hugo Reveal.js project"
	@echo "Available targets:"
	@echo "  up        	  Serve the project locally"
	@echo "  docker-up    Serve the project in a Docker container"
	@echo "  clean        Clean up build artifacts"
	@echo "  show-logs    Show logs if enabled"
	@echo "  help         Show this help message"
