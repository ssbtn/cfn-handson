#!/bin/bash
CFN_TEMPLATE=nat-instance-cfn.yaml
CFN_STACK_NAME=sample-012-nat-instance

CHANGESET_OPTION="--no-execute-changeset"
EXEC_OPTION="deploy"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
elif [ $# = 1 ] && [ $1 = "delete" ]; then
  echo "delete mode"
  CHANGESET_OPTION=""
  EXEC_OPTION="delete-stack"
  aws cloudformation ${EXEC_OPTION} --stack-name ${CFN_STACK_NAME}
  aws cloudformation wait stack-delete-complete --stack-name ${CFN_STACK_NAME}
  exit
else
  echo "check change set mode"
fi

#  テンプレートの実行
aws cloudformation ${EXEC_OPTION} --stack-name ${CFN_STACK_NAME} --template-file ${CFN_TEMPLATE} ${CHANGESET_OPTION} \
--capabilities CAPABILITY_NAMED_IAM
#  --parameter-overrides \
#  NameTagPrefix=prd \
#  VPCCIDR=10.70