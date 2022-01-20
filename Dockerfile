FROM ghcr.io/kyverno/kyverno-cli:1.6-dev-latest as kyverno-cli

FROM alpine/k8s:1.21.2

RUN apk add --no-cache yq
COPY --from=kyverno-cli /kyverno /usr/local/bin/kyverno
COPY run.sh /usr/local/bin/run.sh

ENV POLICY_VERSION=0.0.0

CMD run.sh