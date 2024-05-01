#!/bin/bash
eksctl create cluster -f ClusterCreate.yaml
sleep 20
# Add EKS Helm repository
helm repo add eks https://aws.github.io/eks-charts

# Install AWS Load Balancer Controller
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --set clusterName=my-cluster \
    -n kube-system \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller

