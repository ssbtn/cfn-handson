#!/bin/bash
EXEC_OPTION=""

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  EXEC_OPTION="deploy"
elif [ $# = 1 ] && [ $1 = "delete" ]; then
  echo "delete mode"
  EXEC_OPTION="delete"
  ./013-private-subnet-cfn.sh ${EXEC_OPTION}
  ./012-nat-instance-cfn.sh ${EXEC_OPTION}
  ./011-public-subnet-cfn.sh ${EXEC_OPTION}
  ./010-vpc-cfn.sh ${EXEC_OPTION}
  exit
fi

#  テンプレートの実行
./010-vpc-cfn.sh ${EXEC_OPTION}
./011-public-subnet-cfn.sh ${EXEC_OPTION}
./012-nat-instance-cfn.sh ${EXEC_OPTION}
./013-private-subnet-cfn.sh ${EXEC_OPTION}