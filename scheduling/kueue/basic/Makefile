.PHONY: help stop run setup teardown

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

stop: ## Delete all jobs in project-a and project-b
	-oc delete jobs -n project-a -l job/all=true
	-oc delete jobs -n project-b -l job/all=true

run: ## Create 6 jobs in each of project-a and project-b
	for i in $$(seq 0 5); do oc create -n project-a -f ../job-sleep.yaml ; done
	for i in $$(seq 0 5); do oc create -n project-b -f ../job-sleep.yaml ; done

setup: ## Create the two-project-clusterqueue
	oc apply --server-side -f ../namespace.yaml
	oc apply --server-side -f default-flavor.yaml
	oc apply --server-side -f cq.yaml
	oc apply --server-side -f lq.yaml

teardown: ## Delete the two-project-clusterqueue
	-oc delete -f cq.yaml
	-oc delete -f lq.yaml
	-oc delete -f default-flavor.yaml
