#!/bin/bash

set -e

echo "Checking policy version..."

FETCHED_POLICY_VERSION=$(yq eval '.commonLabels["mycompany.com/policy-version"]' kustomization.yaml)

POLICY_VERSION="${FETCHED_POLICY_VERSION:=$POLICY_VERSION}"

echo "Policy version: ${POLICY_VERSION}"

echo "Fetching Policy..."

git clone --quiet --depth 1 --branch ${POLICY_VERSION} https://github.com/example-policy-org/policy.git /policy

echo "Policy fetched."
echo "Running policy checker..."

kubectl kustomize . | kyverno apply  /policy/kubernetes/kyverno/*/policy.yaml --resource -