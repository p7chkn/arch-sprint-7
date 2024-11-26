#!/bin/bash

# Привязка пользователя viewer-user к роли viewer-role
kubectl create rolebinding viewer-binding \
  --role=viewer-role \
  --serviceaccount=default:viewer-user \
  --namespace=default

# Привязка пользователя config-user к роли config-role
kubectl create clusterrolebinding config-binding \
  --clusterrole=config-role \
  --serviceaccount=default:config-user

# Привязка пользователя privileged-user к роли privileged-role
kubectl create clusterrolebinding privileged-binding \
  --clusterrole=privileged-role \
  --serviceaccount=default:privileged-user

# Подтверждение привязки
echo "Привязки пользователей к ролям выполнены:"
kubectl get rolebindings,clusterrolebindings
