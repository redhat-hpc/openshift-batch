.PHONY: help run run-priority stop setup teardown

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

run: ## Create low priority job
	oc create -n project-b -f job-low-priority.yaml

run-priority: ## Create high priority job to preempt low priority
	oc create -n project-a -f job-high-priority.yaml

stop: ## Delete all jobs in project-a and project-b
	-oc delete jobs -n project-a -l job/all=true
	-oc delete jobs -n project-b -l job/all=true

setup: ## Create
	oc apply --server-side -f ../namespace.yaml
	oc apply --server-side -f default-flavor.yaml -f gpu-flavor.yaml
	oc apply --server-side -f team-a-cq.yaml -f team-b-cq.yaml -f shared-cq.yaml
	oc apply --server-side -f team-a-local-queue.yaml -f team-b-local-queue.yaml
	oc apply --server-side -f workloadpriority.yaml

teardown: ## Delete
	-oc delete -f workloadpriority.yaml
	-oc delete -f team-a-local-queue.yaml -f team-b-local-queue.yaml
	-oc delete -f team-a-cq.yaml -f team-b-cq.yaml -f shared-cq.yaml
	-oc delete -f default-flavor.yaml -f gpu-flavor.yaml
