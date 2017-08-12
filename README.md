# Rails + GKE + Terraform

```
$ cd terraform
$ terraform plan
$ terraform apply
```

```
gcloud auth login
gcloud config set project rails-docker
gcloud config set compute/zone asia-northeast1-a
gcloud container clusters get-credentials rails-cluster
```

## Docker

```
docker build -t rails-docker .
docker run -it -d -w /app -v "$PWD:/app" -p 9292:9292 rails-docker
```

## deployment

```
export PROJECT_ID=rails-docker
export INSTANCE_CONNECTION_NAME="rails-docker:asia-northeast1:rails-sql2"
export IMAGE_RAILS="rails"
export TAG="v2"
```

```
docker build -t gcr.io/${PROJECT_ID}/${IMAGE_RAILS}:${TAG} .
gcloud docker -- push gcr.io/${PROJECT_ID}/${IMAGE_RAILS}:${TAG}

envsubst < ./k8s/deployment.yaml | kubectl create -f -
```
