## Docs eksctl 
https://eksctl.io/usage/creating-and-managing-clusters/

This builds the Cloudformation template and runs it. 

The Cloudformation template generated is saved here for reference.



## Install eksctl 
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp/ && \
   sudo mv /tmp/eksctl /usr/local/bin && \
   sudo chown root:root /usr/local/bin/eksctl && \
   sudo chmod 755 /usr/local/bin/eksctl 
```

## Examples 
https://github.com/weaveworks/eksctl/tree/main/examples

## Dry Run 
https://eksctl.io/usage/dry-run/
```
eksctl create cluster --name tjk-test-cluster --dry-run
```



## Create Cluster 
```
eksctl create cluster -f cluster.yaml
```

## Delete Cluster 
```
eksctl delete cluster -f cluster.yaml
```

## eksctl did not work 
The Udacity profile does not have access required to build this. 

Cloudformation Error:
```
AccessDenied. User doesn't have permission to call iam:GetInstanceProfile
```