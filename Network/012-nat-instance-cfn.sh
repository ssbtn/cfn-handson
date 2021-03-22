#!/bin/bash

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_TEMPLATE=nat-instance-cfn.yaml
CFN_STACK_NAME=sample-012-nat-instance

#  テンプレートの実行
aws cloudformation deploy --stack-name ${CFN_STACK_NAME} --template-file ${CFN_TEMPLATE} ${CHANGESET_OPTION} \
--capabilities CAPABILITY_NAMED_IAM
#  --parameter-overrides \
#  NameTagPrefix=prd \
#  VPCCIDR=10.70