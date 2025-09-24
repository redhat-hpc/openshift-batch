.PHONY: help

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

run: ## Create 6 jobs in each of project-a and project-b
	for i in $$(seq 0 5); do oc create -n project-a -f ../job-sleep.yaml ; done
	for i in $$(seq 0 5); do oc create -n project-b -f ../job-sleep.yaml ; done

setup: ## Create
	oc apply -f default-flavor.yaml -f gpu-flavor.yaml
	oc apply -f team-a-cq.yaml -f team-b-cq.yaml -f shared-cq.yaml
	oc apply -f team-a-local-queue.yaml -f team-b-local-queue.yaml
	oc apply -f workloadpriority.yaml

teardown: ## Delete
	oc delete -f workloadpriority.yaml
	oc delete -f team-a-local-queue.yaml -f team-b-local-queue.yaml
	oc delete -f team-a-cq.yaml -f team-b-cq.yaml -f shared-cq.yaml
	oc delete -f default-flavor.yaml -f gpu-flavor.yaml
