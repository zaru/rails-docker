# Rails + GKE + Terraform

## Create GKE cluster and CloudSQL instance

```
cd terraform
terraform plan
terraform apply
```

## Set secret keys of CloudSQL

```
kubectl create secret generic cloudsql-instance-credentials \
  --from-file=credentials.json=./terraform/sql-client.json

kubectl create secret generic cloudsql-db-credentials \
  --from-literal=username=sql-user
kubectl create secret generic cloudsql-db-credentials-password \
  --from-literal=password=sql-password
```

## Configure gcloud auth and credentials

```
gcloud auth login
gcloud config set project rails-docker
gcloud config set compute/zone asia-northeast1-a
gcloud container clusters get-credentials rails-cluster
```

## Docker build

```
docker build -t rails-docker .
docker run -it -d --rm -w /app -v "$PWD:/app" -p 9292:9292 --name rails-docker rails-docker
```

## k8s deployment

```
export PROJECT_ID=rails-docker
export INSTANCE_CONNECTION_NAME="rails-docker:asia-northeast1:rails-sql4"
export IMAGE_RAILS="rails"
export TAG="v10"
```

```
docker build -t gcr.io/${PROJECT_ID}/${IMAGE_RAILS}:${TAG} .
gcloud docker -- push gcr.io/${PROJECT_ID}/${IMAGE_RAILS}:${TAG}

envsubst < ./k8s/deployment.yaml | kubectl create -f -
```
