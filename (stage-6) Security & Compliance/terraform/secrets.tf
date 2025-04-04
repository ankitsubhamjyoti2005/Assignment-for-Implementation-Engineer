env:
  - name: DATABASE_PASSWORD
    valueFrom:
      secretKeyRef:
        name: aws-secrets-manager
        key: database-credentials
