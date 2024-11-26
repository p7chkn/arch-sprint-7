#!/bin/bash

# Создание пользователя для группы "viewer-user"
kubectl create serviceaccount viewer-user

# Создание пользователя для группы "config-user"
kubectl create serviceaccount config-user

# Создание пользователя для группы "privileged-user"
kubectl create serviceaccount privileged-user

# Подтверждение создания пользователей
echo "Пользователи созданы:"
kubectl get serviceaccounts
