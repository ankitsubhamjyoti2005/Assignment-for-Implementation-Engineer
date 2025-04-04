## ⚙️ Prerequisites

- AWS Account
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [eksctl](https://eksctl.io/)
- [Helm](https://helm.sh/docs/intro/install/)
- Docker (for image builds)

---
### 1️⃣ Configure AWS Credentials

```bash
aws configure
```

### 2️⃣ Provision Infrastructure via Terraform
```
cd terraform
terraform init
terraform apply
```
Resources created:
VPC (public/private subnets)
EKS Cluster (1 node group)
RDS PostgreSQL DB


### 3️⃣ Connect kubectl with EKS
```
aws eks --region us-east-1 update-kubeconfig --name onfinance-eks
kubectl get nodes
```

### 3️⃣ Connect kubectl with EKS
```
aws eks --region us-east-1 update-kubeconfig --name onfinance-eks
kubectl get nodes
```

### 4️⃣ Deploy K8s Components
#### Step 1: Apply Configurations
```
kubectl apply -f config/configmap.yaml
kubectl apply -f config/secrets.yaml
kubectl apply -f deployments/backend-deployment.yaml
kubectl apply -f services/backend-service.yaml
kubectl apply -f deployments/frontend-deployment.yaml
kubectl apply -f services/frontend-service.yaml
kubectl apply -f autoscaling/hpa.yaml
kubectl apply -f ingress/ingress.yaml
```
#### Step 2: Verify Deployments
```
kubectl get pods
kubectl get services
kubectl get hpa
kubectl get ingress
```
