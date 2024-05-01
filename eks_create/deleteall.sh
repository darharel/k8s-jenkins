#!/bin/bash
helm uninstall chart my-chart
eksctl delete cluster -f ClusterCreate.yaml
