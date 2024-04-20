Put NIM runtimes in this directory. There should be 1 NIM runtime defined for each release version and each NIM modality. See [https://build.nvidia.com/](https://build.nvidia.com/) for a complete list of NIM modalities and the corresponding models, examples, and containers.

For example:

|        | Reasoning (LLM)                     | Visual Design (Image)                 | Speech                               | Biology (BioNeMo)                  |
|--------|-------------------------------------|---------------------------------------|--------------------------------------|------------------------------------|
| 24.01  | [runtime](24.01-nim_llm.yaml)       | n/a      | n/a           | n/a        |
| 24.02  | [runtime](24.02-nim_llm.yaml)       | n/a      | n/a           | n/a        |
| 24.04  | n/a       | n/a      | n/a           | n/a        |
