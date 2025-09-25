.PHONY: help watch-project-a watch-project-b watch-queues

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

watch-project-a: ## Watch running pods in project-a namespace
	watch -t -n 1 'echo "Workloads in project-a namespace:" && \
		oc get workloads -n project-a --sort-by=.metadata.creationTimestamp && \
	    echo "\nPods in project-a namespace:" && \
		oc get pods -n project-a --sort-by=.metadata.creationTimestamp'

watch-project-b: ## Watch running pods in project-a namespace
	watch -t -n 1 'echo "Workloads in project-b namespace:" && \
		oc get workloads -n project-b --sort-by=.metadata.creationTimestamp && \
	    echo "\nPods in project-b namespace:" && \
		oc get pods -n project-b --sort-by=.metadata.creationTimestamp'

watch-queues: ## Watch all ClusterQueues and LocalQueues
	watch -t 'echo "ClusterQueues, LocalQueues, WorkloadPriorityClass:" && \
	    oc get clusterqueue,localqueue,workloadpriorityclass -A'

setup: ## setup namespaces
	oc apply --server-side -f namespace.yaml
