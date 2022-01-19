# Reusable policy checker github workflow

> Archived since have replaced for now with a single reusable docker image

So instead you just need a file like this in the repo

```yaml
name: Policy

on:
  push:
  pull_request:

jobs:

  policy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2.4.0
      - uses: docker://ghcr.io/example-policy-org/policy-checker:latest
```
