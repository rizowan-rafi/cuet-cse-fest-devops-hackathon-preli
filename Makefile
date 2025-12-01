# Variables
DOCKER_COMPOSE_DEV = docker compose -f docker/compose.development.yaml --env-file .env
DOCKER_COMPOSE_PROD = docker compose -f docker/compose.production.yaml --env-file .env

# === Development Commands ===
.PHONY: dev-build
dev-build:
	$(DOCKER_COMPOSE_DEV) build

.PHONY: dev-up
dev-up:
	$(DOCKER_COMPOSE_DEV) up

.PHONY: dev-down
dev-down:
	$(DOCKER_COMPOSE_DEV) down

# === Production Commands ===
.PHONY: prod-build
prod-build:
	$(DOCKER_COMPOSE_PROD) build

.PHONY: prod-up
prod-up:
	$(DOCKER_COMPOSE_PROD) up -d

.PHONY: prod-down
prod-down:
	$(DOCKER_COMPOSE_PROD) down

# === Utilities ===
.PHONY: clean
clean:
	docker system prune -f