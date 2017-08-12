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
