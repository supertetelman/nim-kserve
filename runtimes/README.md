Put NIM runtimes in this directory. There should be 1 NIM runtime defined for each release version and each NIM modality. See [https://build.nvidia.com/](https://build.nvidia.com/) for a complete list of NIM modalities and the corresponding models, examples, and containers.


For example:

|        | Reasoning (LLM)                     | Visual Design (Image)                 | Speech                               | Biology (BioNeMo)                  |
|--------|-------------------------------------|---------------------------------------|--------------------------------------|------------------------------------|
| 24.01  | [runtime](24.01-nim_llm.yaml)       | n/a      | n/a           | n/a        |
| 24.02  | [runtime](24.02-nim_llm.yaml)       | n/a      | n/a           | n/a        |
| 24.04  | n/a       | n/a      | n/a           | n/a        |


## Additional configurations

In some more hardened deployments of Kubeflow, it may be necessary to run NIM as root for the `ln -s` commands to work effectively. In these scenarios the following lines should be added to the `kserve-container` object in the runtime as below. It is a best practice to never run as root in production and to instead fix the model permission issues that necessitate these configuration changes.

```
      env:
      - name: OMPI_ALLOW_RUN_AS_ROOT
        value: "1"
      - name: OMPI_ALLOW_RUN_AS_ROOT_CONFIRM
        value: "1"
      securityContext:
        runAsUser: 0
```