```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl apply -f grafana-dashboard.yaml
helm install prometheus prometheus-community/kube-prometheus-stack -f prometheus-values.yaml --namespace monitoring --create-namespace
```

If updating grafana-dashboard and got error due to misformat or wrong indentation
`sed 's/^/    /' dashboard.json > indented-dashboard.json`