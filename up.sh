#!/bin/bash
helm repo update
kubectl create namespace monitoring
kubectl apply -f grafana-dashboard.yaml -n monitoring 
helm install prometheus prometheus-community/kube-prometheus-stack -f prometheus-values.yaml --namespace monitoring --create-namespace
kubectl apply -f pod-health-alerts.yaml -n monitoring
