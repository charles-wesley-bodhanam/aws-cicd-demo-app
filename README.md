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
- AWS CodeDeploy (Blue/Green deployment)
- Amazon EC2 (Replacement instances managed by CodeDeploy)

---

## CI/CD Workflow

1. Source code changes are pushed to GitHub.
2. AWS CodePipeline detects the change and triggers the pipeline.
3. AWS CodeBuild builds the Docker image using `buildspec.yml` and pushes the image to Amazon ECR (private repository).
4. AWS CodeDeploy initiates a Blue/Green deployment and provisions replacement EC2 instances (Green environment).
5. Application deployment is managed using CodeDeploy lifecycle hooks:
   - BeforeInstall (cleanup of existing containers)
   - AfterInstall (pulling image and starting new container)
6. Traffic is shifted automatically from the old (Blue) instances to the new (Green) instances.
7. Original instances are terminated after successful deployment, with rollback support enabled on failure.

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
- Amazon ECR (Private)
- Amazon EC2
- Docker
- GitHub
- Bash scripting

---

## Repository Structure

├── Dockerfile
├── buildspec.yml
├── appspec.yml
├── scripts/
│   ├── cleanup.sh
│   ├── start.sh
│   └── stop.sh
├── app.js
├── package.json
├── package-lock.json
└── README.md

- `buildspec.yml` handles Docker build and ECR push via AWS CodeBuild  
- `appspec.yml` and `scripts/` enable Blue/Green deployments using AWS CodeDeploy lifecycle hooks

---

## Impact

- Designed and implemented an end-to-end AWS CI/CD pipeline that automatically builds, containerizes, and deploys a Node.js application on EC2.
- Reduced manual deployment effort by enabling fully automated builds and deployments using AWS managed services.
- Implemented container-based deployments using Docker and Amazon ECR with secure IAM role-based access.

## Key Learnings

- Used AWS CodeDeploy lifecycle hooks (BeforeInstall, AfterInstall) to safely replace containers and automate rollback on failure.
- Designed and implemented a production-grade AWS CI/CD pipeline using managed AWS services.
- Containerized a Node.js application using Docker and managed images in Amazon ECR (private).
- Implemented Blue/Green deployments using AWS CodeDeploy to achieve zero-downtime releases.
- Debugged real-world deployment issues related to ECR authentication, shell scripting, and deployment health.

---

## Notes

- This project focuses on in-place deployments using AWS CodeDeploy.
- Blue/Green deployments implemented using AWS CodeDeploy with traffic switching.
- This project reflects real-world deployment challenges and solutions.

---

## Author

Charles Wesley Bodhanam
- Aspiring DevOps / AWS / Cloud Engineer
