# kueue

## Install

Create operator deployment

TODO

Create queues

```
$ oc apply --server-side -f single-clusterqueue-setup.yaml
```

## Test jobs

```
$ for i in $(seq 0 5); do oc create -f job-sleep.yaml ; done
```

```
$ oc get clusterqueue,localqueue
NAME                                        COHORT   PENDING WORKLOADS
clusterqueue.kueue.x-k8s.io/cluster-queue            0

NAME                                   CLUSTERQUEUE    PENDING WORKLOADS   ADMITTED WORKLOADS
localqueue.kueue.x-k8s.io/user-queue   cluster-queue   0                   0
```

```
$ oc get jobs --sort-by=.metadata.creationTimestamp
NAME               COMPLETIONS   DURATION   AGE
sample-job-66fkp   3/3           36s        3m17s
sample-job-6c4gk   3/3           34s        2m10s
sample-job-lpk76   3/3           34s        2m10s
sample-job-r2drt   3/3           34s        2m10s
sample-job-zrpvs   3/3           34s        2m10s
sample-job-9rzx8   3/3           34s        2m9s
sample-job-crtwt   3/3           34s        2m9s
```
