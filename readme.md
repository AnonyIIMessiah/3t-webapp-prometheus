# Steps to use it
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
kubectl apply -f grafana-dashboard.yaml -n monitoring 
helm install prometheus prometheus-community/kube-prometheus-stack -f prometheus-values.yaml --namespace monitoring --create-namespace --set-string  alertmanager.config.receivers[0].slack_configs[0].api_url="your_slack_webhook_url"
kubectl apply -f pod-health-alerts.yaml -n monitoring
```

If updating grafana-dashboard and got error due to misformat or wrong indentation
`sed 's/^/    /' dashboard.json > indented-dashboard.json`