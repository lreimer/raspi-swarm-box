NAME = raspi-swarm-box

.PHONY: info

info:
	@echo "The Raspberry Pi Swarm Box"

openfaas-sources:
	@mkdir -p openfaas && rm -rf openfaas/faas/
	@git clone --depth 1 https://github.com/openfaas/faas.git openfaas/faas

openfaas-install:
	@curl -sL https://cli.openfaas.com | sudo sh
	@faas-cli login --password admin

openfaas-delete:
	@docker stack rm openfaas
