# Kueue Basic Testing

## Overview
In this example, there are 2 teams that work in their own namespace:

1. Project A and B belongs to the same [cohort](https://kueue.sigs.k8s.io/docs/concepts/cluster_queue/#cohort)
1. Both projects share a quota

### Kueue Configuration

There is a single `ResourceFlavor`

Both projects have a shared cluster queue that is associated with their respective namespace.

| Name                        | CPU | Memory (GB)
| --------------------------- | --- | -----------
| Shared ClusterQueue         | 9   | 36

### Demo

Set up the ClusterQueue

```
make setup
```

Run 6 30s sleep jobs in both project-a and project-b

```
make run
```

### Clean up

```
make stop
make teardown
```
