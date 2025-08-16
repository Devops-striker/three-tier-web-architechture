# 🌐 Three-Tier Web Architecture with Terraform - by Bhargava Nikhil

This repository is a **modular Terraform project** that provisions a complete **Three-Tier Web Application Architecture** on AWS.  
It is designed with **reusability, scalability, and automation** in mind – each layer of the architecture is built as a separate Terraform module.

---

## Architecture Overview

The final architecture will include:

1. **Networking Layer (VPC)**
   - VPC with public & private subnets across multiple AZs  
   - Internet Gateway & NAT Gateway  
   - Route tables & associations  

2. **Application Layer**
   - Auto Scaling Group of EC2 instances  
   - Load Balancer (ALB) for traffic distribution  
   - Security Groups for tier separation  

3. **Data Layer**
   - RDS Database in private subnets  
   - Option for multi-AZ & backups  

---

