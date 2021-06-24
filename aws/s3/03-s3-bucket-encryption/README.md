
# Amazon S3 Encryption

The terraform demo source code demonstrates S3 bucket encryption via AWS KMS keys. 
It also make use of S3 bucket keys feature to minimize the overall cost of Server Side encryption.

# Prerequisites
The following items must be configured before proceeding for the demo

* Terraform 0.13 or newer
* Git command line tool (https://help.github.com/articles/set-up-git)
* Your preferred IDE
    * [VS Code](https://code.visualstudio.com)
* [AWS CLI ver 2.0](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* [AWS Account - Free Tier](https://aws.amazon.com/free)
* [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

# Software Version
* Terraform 0.15+
* AWS Provider Plugin 3.0+
## Installation Steps

Clone the following Github Repo
```bash 
  git clone https://github.com/manish6385/terraform.git
  cd terraform && cd aws && cd s3 && cd 03-s3-bucket-encryption
```

Initialise the working directory with relevant Terraform plugins
```bash
terraform init
```

Create Terraform execution plan
   ```bash
   terraform plan
   ```
Apply the changes required to achieve the desired state of configuration
   ```bash
   terraform apply -auto-approve
   ```
Validate the creation of S3 bucket in AWS Console (i.e. Name - g33kzone-<random-string>)
Under Configuration tab, validate the SSE encryption configured.

Destroy the EC2 instance created & managed by Terraform
   ```bash
   terraform destroy -auto-approve
   ```
    