#!/bin/bash

# Создание роли для просмотра ресурсов
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: viewer-role
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "endpoints"]
    verbs: ["get", "list", "watch"]
EOF

# Создание роли для настройки кластера
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: config-role
rules:
  - apiGroups: [""]
    resources: ["*"]
    verbs: ["get", "list", "watch", "create", "delete", "update", "patch"]
EOF

# Создание роли для привилегированных действий
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: privileged-role
rules:
  - apiGroups: [""]
    resources: ["secrets"]
    verbs: ["get", "list", "watch", "create", "delete", "update"]
EOF

# Подтверждение создания ролей
echo "Роли созданы:"
kubectl get roles,clusterroles
