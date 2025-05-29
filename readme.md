# 3T Web App Prometheus Monitoring

A comprehensive Kubernetes monitoring solution using Prometheus, Grafana, and Alertmanager for monitoring web applications and infrastructure health.

## 🚀 Overview

This repository provides a complete monitoring stack setup for Kubernetes environments, specifically designed to monitor web applications with real-time metrics, custom dashboards, and intelligent alerting capabilities.

### Key Features

- **Prometheus Monitoring**: Complete metrics collection and storage
- **Grafana Dashboards**: Custom visualization and monitoring dashboards
- **Alertmanager Integration**: Intelligent alerting with Slack notifications
- **Pod Health Monitoring**: Automated health checks and alerts
- **Easy Deployment**: One-command installation with Helm charts

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- Kubernetes cluster (v1.20+)
- kubectl configured and connected to your cluster
- Helm 3.x installed
- Slack webhook URL (for alert notifications)

## 🛠️ Installation

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/AnonyIIMessiah/3t-webapp-prometheus.git
   cd 3t-webapp-prometheus
   ```

2. **Add Prometheus Helm repository**
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

3. **Create monitoring namespace**
   ```bash
   kubectl create namespace monitoring
   ```

4. **Deploy Grafana dashboard**
   ```bash
   kubectl apply -f grafana-dashboard.yaml -n monitoring
   ```

5. **Install Prometheus stack**
   ```bash
   helm install prometheus prometheus-community/kube-prometheus-stack \
     -f prometheus-values.yaml \
     --namespace monitoring \
     --create-namespace \
     --set-string alertmanager.config.receivers[0].slack_configs[0].api_url="YOUR_SLACK_WEBHOOK_URL"
   ```
   
   > ⚠️ **Important**: Replace `YOUR_SLACK_WEBHOOK_URL` with your actual Slack webhook URL

6. **Apply pod health alerts**
   ```bash
   kubectl apply -f pod-health-alerts.yaml -n monitoring
   ```

## 📁 Repository Structure

```
3t-webapp-prometheus/
├── prometheus-values.yaml      # Prometheus configuration values
├── grafana-dashboard.yaml      # Grafana dashboard definitions
├── pod-health-alerts.yaml      # Pod monitoring alert rules
├── dashboard.json             # Dashboard JSON configuration
└── README.md                  # This file
```

## 🔧 Configuration Files

### prometheus-values.yaml
Contains custom configuration for the Prometheus stack including:
- Resource limits and requests
- Storage configuration
- Service monitor settings
- Custom scrape configurations

### grafana-dashboard.yaml
Defines custom Grafana dashboards for:
- Application metrics visualization
- Infrastructure monitoring
- Performance metrics
- Alert status dashboards

### pod-health-alerts.yaml
Configures alerting rules for:
- Pod health status monitoring
- Resource utilization alerts
- Application-specific alerts
- Infrastructure health checks

## 📊 Accessing the Monitoring Stack

### Grafana Dashboard
```bash
# Port forward to access Grafana UI
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80

# Access at: http://localhost:3000
# Default credentials: admin/prom-operator
```

### Prometheus UI
```bash
# Port forward to access Prometheus UI
kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-prometheus 9090:9090

# Access at: http://localhost:9090
```

### Alertmanager UI
```bash
# Port forward to access Alertmanager UI
kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-alertmanager 9093:9093

# Access at: http://localhost:9093
```

## 🔔 Alert Configuration

### Slack Integration

1. Create a Slack webhook URL in your Slack workspace
2. Replace the webhook URL in the installation command
3. Alerts will be sent to your configured Slack channel

### Custom Alert Rules

The `pod-health-alerts.yaml` file contains predefined alert rules. You can customize these by:

1. Editing the alert conditions
2. Adjusting severity levels
3. Modifying notification channels
4. Adding new alert rules

## 🛠️ Troubleshooting

### Dashboard JSON Formatting Issues

If you encounter formatting issues with dashboard JSON files:

```bash
# Fix indentation issues
sed 's/^/  /' dashboard.json > indented-dashboard.json
```

### Common Issues

1. **Helm installation fails**
   - Ensure you have the correct RBAC permissions
   - Verify your Kubernetes cluster version compatibility

2. **Grafana dashboard not loading**
   - Check if the dashboard YAML is properly formatted
   - Verify the ConfigMap was created successfully

3. **Alerts not firing**
   - Verify Slack webhook URL is correct
   - Check Alertmanager configuration
   - Ensure alert rules are properly deployed

## 📈 Monitoring Metrics

This setup monitors:

- **Application Metrics**: Request rates, response times, error rates
- **Infrastructure Metrics**: CPU, memory, disk, network usage
- **Kubernetes Metrics**: Pod status, deployments, services
- **Custom Metrics**: Application-specific business metrics

## 🔄 Updates and Maintenance

### Updating the Stack

```bash
# Update Helm repositories
helm repo update

# Upgrade Prometheus stack
helm upgrade prometheus prometheus-community/kube-prometheus-stack \
  -f prometheus-values.yaml \
  --namespace monitoring
```

### Updating Dashboards

```bash
# Apply updated dashboard configurations
kubectl apply -f grafana-dashboard.yaml -n monitoring
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Prometheus Community](https://prometheus-community.github.io/) for the excellent Helm charts
- [Grafana](https://grafana.com/) for the visualization platform
- [Kubernetes](https://kubernetes.io/) for the container orchestration platform

---

**Happy Monitoring! 📊✨**
