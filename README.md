# terraform-azure
Terraform repo for my personal Azure lab.

This repo spins up resources in Azure for my projects. Currently, I have created modules to spin up the necessary resources for my [Cloud Portfolio project](https://github.com/packetFury/Cloud-Portfolio). 

### Architecture Design Decisions
This repo is organized with a modular design that allows for maximum reuse of Terraform configuration files. Each module deploys a specific type of resource (ex. Resource Group, Storage Account, CosmosDB, Static Web App, etc.), and is passed variables from the main configuration at the repo's root folder. Variables are separated out to simplify management and make it easier to deploy new resources with different configurations.

A GitHub Actions workflow runs on each Pull Request to scan the committed code with the Checkov SAST tool. Once the PR passes, it is allowed to be merged into the main branch. After merging, it is again scanned with Checkov to ensure that the new combined configuration files do not introduce any new vulnerabilities or misconfiguations that would have been missed otherwise.

### TODO
* Go through Issues raised by Checkov and correct security configurations
* Fix Branch Protection Rules
* Identify other resources to deploy for Azure lab
* Fork this repo and translate to AWS