# Summary
Put `InferenceService` files here. Each NIM should have a corresponding `InferenceService` for a specific version and hardware configuration. Depending on release schedules a single NIM version release may have a day-0 version and a follow-up version that depend on different NIM runtimes such as vllm or trt-llm backends.

NIM YAML files should statically define:
* The required runtime
* The GPU Architecture (statically configured for TRT engines, i.e. A100-40GB, A100-80GB, or H100-80GB)
* The GPU count

A user may need to modify the below settings depending on their cluster and use case:
* NodeLables (`nvidia.com/gpu.product: A100-SXM4-80GB)`)
* Minimum number of replicas (`minReplicas`), setting to 0 will cause delay at first request
* Minimum number of requests per-pod before auto-scaling (`autoscaling.knative.dev/target`)