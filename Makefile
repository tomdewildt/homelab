.PHONY: run/remote run/virtual vm/start vm/stop vm/remove lint
.DEFAULT_GOAL := help

NAMESPACE := tomdewildt
NAME := homelab

help: ## Show this help
	@echo "${NAMESPACE}/${NAME}"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/## */##/' | column -t -s##

##

run/remote: ## Run on the remote machines
	ansible-playbook playbook.yml --ask-become-pass --ask-vault-pass --inventory inventory/remote.yml

run/virtual: ## Run on the virtual machines
	ansible-playbook playbook.yml --ask-vault-pass --inventory inventory/virtual.yml

##

vm/start: ## Start the virtual machines
	vagrant up

vm/stop: ## Stop the virtual machines
	vagrant halt

vm/remove: ## Remove the virtual machines
	vagrant destroy

##

lint: ## Run lint & syntax check
	ansible-playbook --syntax-check playbook.yml --inventory inventory/remote.yml
	ansible-lint --force-color playbook.yml
