# eks-terraform
This repo contains terraform scripts to provision eks from scratch and github workflow to automate 

## Table of Contents

- [Prerequisites](#prerequisites)
- [Provision EKS cluster](#provision-eks-cluster)
    
### Prerequisites:

 * Install [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
 * Install [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
 * AWS account with the IAM permissions listed [here](https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/iam-permissions.md)
   
    or to get started quickly give full access by attaching the following policies `AdministratorAccess` `AmazonEKSClusterPolicy` to your IAM user.

   > Note: [Principle of Least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege) is recommended.

 * a configured AWS CLI 

    create `~/.aws/credentials` file and put your credentials in it or just use `aws configure`

 * install [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html) 
   
   > Note: Skip this installation if your aws cli version is >= 1.16.156, because `aws eks get-token` can get you the token.

 * install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Provision EKS cluster

 * clone this repo 

   ```shell
     git clone https://github.com/vijaysamanuri/eks-terraform
   ```
 * initialize terraform
   ```shell
      cd eks-terraform
      terraform init
    ```
 * create eks cluster
   ```shell
      terraform apply
   ``` 
   this creates many aws resources required for eks cluster to run like vpc, security groups, autoscaling groups, eks cluster etc,
   review the plan and confirm with `yes`
   
   This takes long time to create the above mentioned resources successfully (~10 mins), once completed you should see outputs mentioned in `outputs.tf`

 * get kubeconfig and configure kubectl
   
   ```shell
   aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
   ```
 
 * verify 
  
   execute sample command (ex: `kubectl get ns`)
