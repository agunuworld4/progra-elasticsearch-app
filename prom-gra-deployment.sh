#!/bin/bash
#Add prometheus helm charts
helm repo add prometheus https://prometheus-community.github.io/helm-charts
sleep 40
#Add grafana helm charts
helm repo add grafana https://grafana.github.io/helm-charts
sleep 10
kubectl create ns monitoring
#helm upgrade --install prometheus  prometheus/prometheus -n monitoring -f prometheus_values.yml
ls -lart
helm upgrade --install prometheus  prometheus/prometheus -n monitoring -f alertmanager_rule_11_9_24.yml

sleep 40

#Grafana
helm upgrade --install  grafana grafana/grafana  -n monitoring

sleep 40
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

#kubectl apply -f montoring_rules.yml
