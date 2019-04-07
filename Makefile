NAME = raspi-swarm-box

.PHONY: info

info:
	@echo "The Raspberry Pi Swarm Box"

openfaas-sources:
	@mkdir -p openfaas && rm -rf openfaas/faas/ && rm -rf openfaas/templates
	@git clone --depth 1 https://github.com/openfaas/faas.git openfaas/faas
	@git clone https://github.com/lreimer/templates.git openfaas/templates
	

openfaas-install:
	@curl -sL https://cli.openfaas.com | sudo sh
	@faas-cli login --password admin

openfaas-delete:
	@docker stack rm openfaas
