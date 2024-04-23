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

## Storage location
These InferenceServices make the assumption that there is

* A shared PVC called `nim-pvc` that stores all models
* A top level directory in that PVC called `model-store` where all model files are stored
* A unique directory per-model and per-engine in `pvc://nim-pvc/model-store` that is dependant on the directory structure after downloading the model from NGC or HuggingFace and fully unpacking any tarbals within the downloaded artifact. Examples include `llama-2-7b_vLLAMA-2-7B-4K-FP16-1-A100.24.01/model-store` and `nv-embed-qa_v4_hf`.