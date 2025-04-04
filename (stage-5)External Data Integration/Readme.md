### Deploy Everything to Kubernetes

#### Step 1: Deploy Kafka
```
kubectl apply -f kafka/kafka-deployment.yaml
kubectl apply -f kafka/kafka-service.yaml
```

#### Step 2: Deploy Webhook Server
```
kubectl apply -f webhook/webhook-deployment.yaml
kubectl apply -f webhook/webhook-service.yaml
```

#### Step 3: Deploy Lambda Function
```
terraform apply -auto-approve
```
