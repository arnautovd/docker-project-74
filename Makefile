setup install build prepare-env start dev lint lint-fix test:
	$(MAKE) -C app $@

compose-setup:
	docker compose run --rm app make setup

compose-test: prepare-env
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

ci: prepare-env
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-up:
	docker compose up
