[![CircleCI](https://circleci.com/gh/tomjoseph/devops-capstone.svg?style=svg)](https://circleci.com/gh/tomjoseph/devops-capstone)

# Introduction of the project
This is the DevOps capstone project, to demo complete CI/CD build, lint, deploy automation using docker and kubernetes.   

# Motivation behind the project
Provides a good learning experience on the DevOps pipeline for a real world app. 

# Tech Stack used in the project
1. Python, Flask Framework
2. Github - Git source control repository
3. CircleCI - CircleCI is the continuous integration & delivery platform that helps to automate the build, test, and deploy.
4. Docker - Container service.Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime.
5. Kubernetes [AWS EKS] - An open-source system for automating deployment, scaling, and management of containerized applications. Also known as K8s. Amazon Elastic Kubernetes Service (EKS) is a managed service to run Kubernetes on AWS. The EKS cluster is created using CircleCI and eksctl
6. Ansible - Ansible is an open-source IT automation engine that automates provisioning, configuration management, application deployment and orchestration Since, I used EKS and eksctl, I did not need Ansible for this project. 
7. Make - Defines set of tasks to be executed by make utility in a Makefile. Helps with quick testing of the app and to have the commands in one common file.
8. Docker Register [AWS ECR] - Amazon Elastic Container Registry (ECR) is a managed Docker container registry on AWS

## Application URLS

```
http://af7643c1b09f94672adc7a4bc874a685-1201844613.us-east-1.elb.amazonaws.com/version

http://af7643c1b09f94672adc7a4bc874a685-1201844613.us-east-1.elb.amazonaws.com/hello
```

# Pipeline
The pipeline can be run in 2 modes based on the parameter 'is-eks-cluster-setup'

```
is-eks-cluster-setup: false

Build and setup the EKS cluster usind eksctl circleci orb.
 setup-eks-cluster-infra
    create-eks-clsuter - aws-eks/create-cluster
    test-eks-cluster
```

```
is-eks-cluster-setup: true

Build, lint, create docker image, rolling deploy to EKS and test.
 build-and-deploy-app:
    build-and-lint-app
    docker-build-and-push-image - aws-ecr/build-and-push-image
    deploy-application
    test-application
```

# Screenshots
The folloeing screenshots are attached

This dir has the the screenshots from the EKS cluster setup  

```
+---eks-cluster-setup
|       Screenshot-01-Pipeline-EksClusterSetup-Mode-CircleCI.jpg
|       Screenshot-02-EKSCTL-CF-Stack.jpg
|       Screenshot-03-EKS-Cluster-Active.jpg
|       Screenshot-04-EKS-Nodes-Running.jpg
```

This dir has the the screenshots from the App build and deployment
```
+---app-build-deploy
|       Screenshot-11-PythonLint-Failed1.jpg
|       Screenshot-11-PythonLint-Failed2.jpg
|       Screenshot-12-DockerLint-Failed.jpg
|       Screenshot-13-Lint-Failed-CircleCI.jpg
|       Screenshot-14-ECR-App-Repo.jpg
|       Screenshot-15-Pipeline-BuildDeploy-Mode-CircleCI.jpg
|       Screenshot-16-Auto-LoadBalancer-Setup.jpg
|       Screenshot-18-AppRollingDeploy-And-HealthCheckSuccess.jpg
|       Screenshot-21-AppURLRuning1.jpg
|       Screenshot-21-AppURLRuning2.jpg
```

# Files in the repository
Here are list of files in the repository. 

Note: The dirs and files in this setup dir can be ignored. These were the various types of attempts to get the EKS or Kube cluster up.

```
|   Dockerfile
|   Makefile
|   README.md
|   requirements.txt
|
+---.circleci
|       config.yml
|       Readme.md
|
+---deployment
|       app-deployment.yaml.template
|       app-service.yaml
|
+---setup  * The dirs and files in this setup dir can be ignored. Not used now. *
|   +---ansible
|   +---cf
|   +---circleci
|   \---eksctl
|
\---src
        app.py
```
