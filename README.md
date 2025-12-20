# AWS CI/CD Pipeline with Docker and CodeDeploy

This project demonstrates an end-to-end CI/CD pipeline implemented on AWS to automate the build, containerization, and deployment of a Node.js application on EC2.

---

## Architecture Overview

GitHub → AWS CodePipeline → AWS CodeBuild → Amazon ECR → AWS CodeDeploy → EC2

---

## CI/CD Workflow

1. Source code changes are pushed to GitHub.
2. AWS CodePipeline detects the change and triggers the pipeline.
3. AWS CodeBuild builds the Docker image using `buildspec.yml` and pushes the image to Amazon ECR (private repository).
4. AWS CodeDeploy deploys the application to an EC2 instance using in-place deployment.
5. Deployment lifecycle is managed using CodeDeploy hooks:
   - ApplicationStop
   - ApplicationStart

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

.
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
- Blue/Green deployments with ALB can be implemented as an extension.

---

## Author

Charles Wesley Bodhanam
