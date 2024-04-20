# nim-kserve
Temporary location for documentation an examples showcasing how to deploy and manage NVIDIA NIM with KServe




# Setup

The following steps assumes a running K8s cluster with KServe installed, kubectl access, and NIM access on NGC. The cluster will need a StorageClass that can provide a PV large enough to download and unpack the models (200GB+ for larger models), a LoadBalancer configured in the platform, and supported GPUs for the class of NIM being deployed.

1. Ensure access to the NIM models and the NIM containers by logging into [NGC](ngc.nvidia.com) and browsing to the desired NIM artifacts.

2. Create an API key in NGC and add this as a secret in the namespace being used to launch NIMs. This can be accomplished by running:
```
export NGC_API_KEY=
bash scripts/create-secret.sh
```

3. Create all the NIM runtimes in the K8s cluster. Note these will not be used until an InferenceService is created in a later step.
```
for runtime in `ls -d runtimes/*`; do
  kubectl create -f $runtime
done
```

4. Create a PVC called `nim-pvc` in the cluster and download the models into it.
TODO: Add details NGC download steps here, CLI setup steps, and example pv yaml files
TODO: Add notes about managing multiple different models in the same model-store pvc

```
# Run from inside the PV
ngc registry model download-version --dest "/mnt/model-store" "ohlfw0olaadg/ea-participants/llama-2-7b-chat:LLAMA-2-7B-CHAT-4K-FP16-1-A100.24.01"
# TODO: Add steps to unpack the tarball and ensure it is in the proper folder director of pvc://nim-pvc/model-store
```

5. Create a NIM by instationating the InferenceService corresponding to the NIM model you want to run. Note that the NIMs are a thruple of (model, version, gpu type+quantity), be sure to select the right yaml file.
TODO: Add additional details here 

6. Validate that the NIM is running by posting a query against the KServe endpoint
TODO: Add steps on getting the endpoint

```
curl http://<KSERVE/URL>/v1/chat/completions  \
  -H "Content-Type: application/json" \
  -d '{
    "model": "meta/llama2-70b-chat",
    "messages": [{"role":"user","content":"What is KServe?"}],
    "temperature": 0.5,   
    "top_p": 1,
    "max_tokens": 1024,
    "stream": false 
    }'
```

For additional example queries see the model card on [build.nvidia.com](https://build.nvidia.com/meta/llama3-70b)