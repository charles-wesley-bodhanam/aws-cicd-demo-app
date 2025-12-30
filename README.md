# AWS CI/CD Pipeline with Docker and CodeDeploy - Upgraded to Blue/Green Deployment with Zero Downtime

This project demonstrates an end-to-end CI/CD pipeline implemented on AWS to automate the build, containerization, and deployment of a Node.js application on EC2.

---

## Project Upgrade Summary

This project was upgraded from a basic in-place deployment model to a **production-grade Blue/Green deployment architecture** to eliminate downtime and deployment risk.

### Key Upgrade Highlights:
- Migrated from in-place deployments to **AWS CodeDeploy Blue/Green deployments**
- Implemented **zero-downtime traffic switching** using replacement EC2 instances
- Added **automated rollback safety** for failed deployments
- Introduced **S3-based artifact versioning** for controlled releases
- Resolved real-world deployment failures related to lifecycle hooks and permissions

---

## Architecture Overview

GitHub  
- AWS CodePipeline  
- AWS CodeBuild (Docker build & ECR push)  
- Amazon ECR (Private Image Registry)  
- AWS CodeDeploy (Blue/Green Deployment)  
- EC2 Auto Scaling Group (Replacement Instances)

---

## CI/CD Workflow

1. Source code changes are pushed to GitHub.
2. AWS CodePipeline detects the change and triggers the pipeline.
3. AWS CodeBuild builds the Docker image using `buildspec.yml` and pushes the image to Amazon ECR (private repository).
4. AWS CodeDeploy deploys the application to an EC2 instance using in-place deployment.
5. Deployment lifecycle is managed using CodeDeploy hooks:
   - ApplicationStop
   - ApplicationStart
6. AWS CodeDeploy provisions replacement EC2 instances (Green environment).
7. Traffic is shifted automatically after successful deployment with rollback support.

---

## Deployment Safety & Reliability

- Zero-downtime deployments using Blue/Green strategy
- Automatic rollback on deployment failure
- Instance-level isolation during application updates
- Safe termination of original instances after traffic validation

---

## Real-World Issues Solved

- Fixed CodeDeploy lifecycle hook failures (exit code 127)
- Resolved artifact overwrite conflicts during deployment
- Corrected IAM role permissions for Auto Scaling and S3 access
- Ensured idempotent cleanup scripts for repeated deployments

---

## Technologies Used

- AWS CodePipeline
- AWS CodeBuild
- AWS CodeDeploy
- Amazon EC2
- Amazon ECR (Private)
- Docker
- GitHub
- Bash scripting

---

## Repository Structure

├── Dockerfile
├── buildspec.yml
├── appspec.yml
├── scripts/
│ ├── start.sh
│ └── stop.sh
└── application source code

---

## Impact

- Designed and implemented an end-to-end AWS CI/CD pipeline that automatically builds, containerizes, and deploys a Node.js application on EC2.
- Reduced manual deployment effort by enabling fully automated builds and deployments using AWS managed services.
- Implemented container-based deployments using Docker and Amazon ECR with secure IAM role-based access.

## Key Learnings

- Implemented an automated CI/CD pipeline using AWS managed services.
- Containerized applications using Docker and managed images in Amazon ECR.
- Worked with CodeDeploy lifecycle hooks for in-place EC2 deployments.
- Debugged real-world issues related to ECR authentication, shell scripting, and deployment health.

---

## Notes

- This project focuses on in-place deployments using AWS CodeDeploy.
- Blue/Green deployments implemented using AWS CodeDeploy with traffic switching.
- This project reflects real-world deployment challenges and solutions.

---

## Author

Charles Wesley Bodhanam
