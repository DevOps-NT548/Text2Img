#!/bin/bash

# Get the backend service IP
BACKEND_IP=$(kubectl get svc txt2img-backend -n model-serving -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Update the secret with the backend IP
kubectl create secret generic txt2img-secret \
  --from-literal=NEXT_PUBLIC_BACKEND_URL="http://${BACKEND_IP}:8000" \
  --dry-run=client -o yaml | kubectl apply -f -

# Restart the frontend deployment to pick up the new environment variable
kubectl rollout restart deployment/txt2img-frontend -n model-serving