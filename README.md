# terraform-azure
Terraform repo for my personal Azure lab.

This repo spins up resources in Azure for my projects. Currently, I have created modules to spin up the necessary resources for my [Cloud Portfolio project](https://github.com/packetFury/Cloud-Portfolio). 

### Architecture Design Decisions
This repo is organized with a modular design that allows for maximum reuse of Terraform configuration files. Each module deploys a specific type of resource (ex. Resource Group, Storage Account, CosmosDB, Static Web App, etc.), and is passed variables from the main configuration at the repo's root folder. Variables are separated out to simplify management and make it easier to deploy new resources with different configurations.

A GitHub Actions workflow runs on each Pull Request to scan the committed code with the Checkov SAST tool. Once the PR passes, it is allowed to be merged into the main branch. After merging, it is again scanned with Checkov to ensure that the new combined configuration files do not introduce any new vulnerabilities or misconfiguations that would have been missed otherwise.

Originally, I had planned to use Classic Azure CDN to deploy the website and offload TLS. However, as I attempted to deploy that initial configuration, I learned that Classic Azure CDN is in the process of being deprecated, and that new resources cannot be spun up. So I pivoted to Azure Front Door, which is the preferred alternative. That turned out to be another temporary dead end, as my Azure tenant is still on the free trial. I am taking full advantage of the trial period to deploy resources with a hard budget cutoff that prevents unexpected bills. So I'm not quite ready to upgrade to pay-as-you-go.

To compensate, I redeployed the project as a Static Web App directly on a public Blob Storage. It isn't best practice, but it will allow me to get the necessary practice in developing and deploying through CI/CD until I am ready to upgrade my tier and deploy Azure Front Door.

### TODO
* Go through Issues raised by Checkov and correct security configurations
* Upgrade tier and migrate to Azure Front Door (which resolves CKV_AZURE_190 from Checkov)
* Fix Branch Protection Rules
* Identify other resources to deploy for Azure lab
* Fork this repo and translate to AWS