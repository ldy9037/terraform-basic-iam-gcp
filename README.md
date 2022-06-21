# ldy9037/terraform-basic-iam-gcp

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Terraform GCP Provider를 사용해 IAM 구성

##### 좋은 commit message 작성을 위한 참고자료

- [commit message 작성 규칙](https://meetup.toast.com/posts/106)
- [commit naming](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)


## Table of Contents

- [소개](#소개)
- [시작하기](#시작하기)
- [주의사항](#주의사항)
- [참고](#참고)
- [제작자](#제작자)

## 소개

 GCP Provider를 사용해서 IAM를 구성.  
 
 ##### 기술 스택
 - terraform v1.1.7
 - [google provider](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs)
 
## 시작하기

Creidentials 설정
```sh
gcloud auth login
gcloud config project set <PROJECT_ID>
```

Terraform 변수 용 환경 변수 지정
```sh
# 실제 bucket 명은 <REGION>-<PREFIX>-<BUCKET_NAME> 형태로 생성됨.
export TF_VAR_region=asia-<REGION>
export TF_VAR_state_bucket_prefix=<PREFIX>
export TF_VAR_state_bucket_name=<BUCKET_NAME>

# backend_prefix는 bucket 내에서 tfstate 파일이 저장 될 위치.
export TF_VAR_backend_bucket=${TF_VAR_state_bucket_prefix}-${TF_VAR_region}-${TF_VAR_state_bucket_name}
export TF_VAR_backend_prefix=<BACKEND_PATH>
```

Remote Backend 적용
```sh
terraform init \
-backend-config="bucket=$TF_VAR_backend_bucket" \
-backend-config="prefix=$TF_VAR_backend_prefix"
```
Terraform 구성 시작

```sh
terraform apply
```

## 주의사항


## 참고
- [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Terraform Backend Type: GCS](https://www.terraform.io/language/settings/backends/gcs)

## 제작자
[ldy9037@naver.com]()<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_service_account.service_account_app](https://registry.terraform.io/providers/hashicorp/google/4.20.0/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service Account 목록 | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
