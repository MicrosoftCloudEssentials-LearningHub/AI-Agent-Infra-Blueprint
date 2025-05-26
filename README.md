# Blueprint for AI Agent Infrastructure Stack Implementation

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com) 
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-26

----------

> [!IMPORTANT]
> Please note that `these demos are intended as a guide and are based on my personal experiences. For official guidance, support, or more detailed information, please refer to Microsoft's official documentation or contact Microsoft directly`: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Azure AI Foundry: Your AI App and agent factory](https://azure.microsoft.com/en-us/blog/azure-ai-foundry-your-ai-app-and-agent-factory/)
- [Microsoft Build 2025: The age of AI agents and building the open agentic web](https://blogs.microsoft.com/blog/2025/05/19/microsoft-build-2025-the-age-of-ai-agents-and-building-the-open-agentic-web/)
- [Azure AI Foundry Agent Service documentation](https://learn.microsoft.com/en-us/azure/ai-services/agents/)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Overview](#overview)
- [Important Considerations for Production Environment](#important-considerations-for-production-environment)

</details>

## Overview 

> Below are the resources set up in Azure via Terraform. Please [follow this guide](./terraform-infrastructure/) to deploy the listed resources:

1. **Azure AI Foundry** `Hub and Project`
2. **Azure AI Foundry connections** (`using key or Entra authentication`)
    - Azure `Open AI` service
    - Azure `AI search` service
3. **Azure Infrastructure Components:**
    - **Azure Key Vault**: Securely store and manage secrets, keys, and certificates.
    - **Azure Storage Account**: Provides a scalable storage solution for AI-related data.
    - **Resource Group**: Centralized management for deployed Azure resources.
4. **Permissions assigned in Azure AI Foundry:**
    - `Azure AI Developer` permission for AI project/resource group level.
    - `Cognitive Services Open AI User` permission at resource group level.
5. **Post-Provisioning Steps**:
    - **Deploy GPT-4o-mini** (or `any GPT model of your choice`) 🡢 `AFTER provisioning Azure Open AI`.
    - **Deploy text-embedding-ada-002** 🡢 `AFTER provisioning Azure Open AI` using the appropriate model deployment approach.
    - **Create Azure AI Search Index** 🡢 `AFTER provisioning Azure AI Search`.

## Important Considerations for Production Environment

<details>
  <summary>Public Network Site</summary>
  
  > This example is based on a public network site and is intended for demonstration purposes only. It showcases how several Azure resources can work together to achieve the desired result.

</details>

<details>
  <summary>Private Network Configuration</summary>

 > For enhanced security, consider configuring your Azure resources to operate within a private network. This can be achieved using Azure Virtual Network (VNet) to isolate your resources and control inbound and outbound traffic. Implementing private endpoints for services like Azure Blob Storage and Azure Functions can further secure your data by restricting access to your VNet.

</details>

<details>
  <summary>Security</summary>

  > Ensure that you implement appropriate security measures when deploying this solution in a production environment. This includes: <br/>
  >
  > - Securing Access: Use Azure Entra ID (formerly known as Azure Active Directory or Azure AD) for authentication and role-based access control (RBAC) to manage permissions. <br/>
  > - Managing Secrets: Store sensitive information such as connection strings and API keys in Azure Key Vault. <br/>
  > - Data Encryption: Enable encryption for data at rest and in transit to protect sensitive information.

</details>

<details>
  <summary>Scalability</summary>

  > While this example provides a basic setup, you may need to scale the resources based on your specific requirements. Azure services offer various scaling options to handle increased workloads. Consider using: <br/>
  >
  > - Auto-scaling: Configure auto-scaling for Azure Functions and other services to automatically adjust based on demand. <br/>
  > - Load Balancing: Use Azure Load Balancer or Application Gateway to distribute traffic and ensure high availability.

</details>

<details>
  <summary>Cost Management</summary>

  > Monitor and manage the costs associated with your Azure resources. Use Azure Cost Management and Billing to track usage and optimize resource allocation.

</details>

<details>
  <summary>Compliance</summary>

  > Ensure that your deployment complies with relevant regulations and standards. Use Azure Policy to enforce compliance and governance policies across your resources.
</details>

<details>
  <summary>Disaster Recovery</summary>
   
> Implement a disaster recovery plan to ensure business continuity in case of failures. Use Azure Site Recovery and backup solutions to protect your data and applications.

</details>

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
