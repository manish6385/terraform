<p align="center">
  <h3 align="center">AWS - EC2 Instance :: Add EBS Volume</h3>
</p>

<br/>

<!-- ABOUT THE PROJECT -->
## About The Project
This sample source code makes use of Terraform and AWS Provider to spin up a basic EC2 instance in AWS Cloud and add additional EBS volume.

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
* [Create AWS EC2 Key Pair | _key name as "terraform-key"_](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#prepare-key-pair)

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
   cd terraform && cd aws && cd ec2 && cd 04-ec2-add-ebs-volume
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
6. Validate the creation of EC2 instance in AWS Console (i.e. Name - aws-ec2-ebs-vol)
7. Destroy the EC2 instance created & managed by Terraform
   ```sh
   terraform destroy -auto-approve
   ```