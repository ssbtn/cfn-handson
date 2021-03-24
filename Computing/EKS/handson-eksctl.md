# handson-eksctl
## CreateEKSCluster

Set options using CLI

```Bash
AWS_REGION=$(aws configure get default.region)
eksctl create cluster \
  --name=ekshandson \
  --version 1.18 \
  --nodes=1 --managed \
  --region ${AWS_REGION} --zones ${AWS_REGION}c,${AWS_REGION}d \
  --node-volume-size 30 \
  --ssh-public-key MyAWS-Key \
  --instance-types t3.medium
```

Set options using config-yaml
```
elsctl create cluster -f simple-eks-cluster.yaml
```



## DeleteEKSCluster

```Bash
eksctl delete cluster  --name=ekshandson
```

## Reference

- https://eks-for-aws-summit-online.workshop.aws/
- https://github.com/weaveworks/eksctl/tree/main/examples


