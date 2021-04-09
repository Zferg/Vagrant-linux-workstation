SHELL := /bin/bash

.DEFAULT_GOAL := help

.PHONY: help

help:

		@echo "Usage:"
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

workstation: ## Build the entire ubuntu workstation

		vagrant up workstation --provision

rebuild_workstation: ## Wipes and redeploys the sandbox
		
		vagrant halt workstation
		vagrant destroy workstation -f
		vagrant up workstation
		