<p align="center">
  <h3 align="center">AWS - S3 Bucket :: Basic</h3>
</p>

<br/>

<!-- ABOUT THE PROJECT -->
## About The Project
This sample source code makes use of Terraform and AWS Provider to spin up a basic S3 bucket in AWS Cloud

<br/>

### Prerequisites
The following softwares must be installed in your system
* Terraform 0.13 or newer
* Git command line tool (https://help.github.com/articles/set-up-git)
* Your preferred IDE
  * [VS Code](https://code.visualstudio.com)
* [AWS CLI ver 2.0](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* [AWS Account - Free Tier](https://aws.amazon.com/free)
* [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

<br/>

<!-- Software Version -->
### Software Version
* Terraform 0.13
* AWS Provider 3.x

### Steps
1. On the Command line
   ```sh
   git clone https://github.com/g33kzone/terraform.git
   ```
2. Checkout Folder
   ```sh
   cd terraform && cd aws && cd s3 && cd 01-s3-basic
   ```
3. Initialize the working directory containing Terraform configuration files
   ```sh
   terraform init
   ```
4. Create Terraform execution plan
   ```sh
   terraform plan
   ```
5. Apply the changes required to achieve the desired state of configuration
   ```sh
   terraform apply -auto-approve
   ```
6. Validate the creation of S3 bucket in AWS Console (i.e. Name - g33kzone-s3-test-bucket)
7. Destroy the S3 bucket created & managed by Terraform
   ```sh
   terraform destroy -auto-approve
   ```