#!/bin/bash

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

CFN_TEMPLATE=private-subnet-cfn.yaml
CFN_STACK_NAME=sample-013-private-subnet

#  テンプレートの実行
aws cloudformation deploy --stack-name ${CFN_STACK_NAME} --template-file ${CFN_TEMPLATE} ${CHANGESET_OPTION} \
#  --parameter-overrides \
#  NameTagPrefix=prd \
#  VPCCIDR=10.70