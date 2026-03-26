ENV_FILE := .env

ifneq (,$(wildcard $(ENV_FILE)))
  include $(ENV_FILE)
  export $(shell sed 's/=.*//' $(ENV_FILE))
endif

export AWS_ACCESS_KEY_ID     := $(aws_access_key_id)
export AWS_SECRET_ACCESS_KEY := $(aws_secret_access_key)

.PHONY: init fmt validate plan apply destroy

init:
	terraform init

fmt:
	terraform fmt -recursive

validate:
	terraform validate

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve
