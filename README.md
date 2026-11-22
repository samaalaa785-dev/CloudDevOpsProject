# Cloud DevOps Project

## 1. Project Overview

This project demonstrates an automated Cloud DevOps workflow for deploying a microservices-based application.

It combines application containerization, Infrastructure as Code, CI/CD automation, security scanning, container registry management, and Kubernetes deployment.

The project aims to demonstrate how modern DevOps tools can be integrated to automate the application delivery lifecycle.

## 2. Application Architecture

The application consists of four main components:

- **Frontend:** Node.js application providing the user interface.
- **Auth Service:** Python Flask microservice responsible for authentication.
- **Roadmap Service:** Java Spring Boot microservice.
- **Database:** MySQL for data storage.

The application components are containerized using Docker and can run together using Docker Compose.

## 3. Technologies and Tools

| Category | Technologies |
|----------|-------------|
| Programming Languages | Java, Python, JavaScript |
| Backend Frameworks | Spring Boot, Flask |
| Database | MySQL |
| Containerization | Docker |
| Container Orchestration | Kubernetes |
| Local Kubernetes | Minikube |
| Infrastructure as Code | Terraform |
| CI/CD | GitHub Actions |
| Self-hosted Runner | GitHub Actions Runner |
| Container Registry | Docker Hub |
| Security Scanning | Gitleaks, Trivy |
| Version Control | Git, GitHub |
| Operating System | Ubuntu Linux (WSL2) |

## 4. Docker and Containerization

Docker was used to containerize the application services.

Docker Compose was configured to run the application components together:

- Frontend
- Authentication Service
- Roadmap Service
- MySQL Database

This provides a consistent environment for running the application and managing its services.

## 5. Infrastructure as Code - Terraform

Terraform was used to organize the infrastructure configuration through reusable modules.

The infrastructure configuration includes modules for:

- Networking
- Server resources
- Amazon EKS
- Amazon ECR

Terraform formatting and validation were performed to verify the configuration.

**Implementation note:** Terraform modules were validated, but AWS infrastructure provisioning was not performed as part of the completed deployment.

## 6. Continuous Integration and Continuous Delivery (CI/CD)

GitHub Actions was used to automate the application delivery workflow.

The project includes the following workflows:

### 6.1 CI - Build Microservices

This workflow automates the build process for the application microservices.

### 6.2 Security Scanning

Security checks were integrated into the pipeline using:

- **Gitleaks:** Detects exposed secrets and credentials.
- **Trivy:** Scans container images for security vulnerabilities.

### 6.3 Docker Build and Push

The pipeline automates:

1. Building Docker images.
2. Preparing images for publishing.
3. Pushing images to Docker Hub.

### 6.4 Kubernetes Deployment

A self-hosted GitHub Actions Runner was configured to execute deployment tasks.

The runner connects the GitHub Actions workflow to the local Minikube Kubernetes cluster.

This enables automated deployment of the application to Kubernetes.

## 7. Kubernetes Deployment

Minikube was used as the local Kubernetes environment.

The application was deployed using Kubernetes resources.

The following application components were successfully deployed:

- Frontend
- Authentication Service
- Roadmap Service
- MySQL Database

All four application components reached the Running state in the Kubernetes cluster.

The deployment workflow was integrated with GitHub Actions using the self-hosted runner.

## 8. CI/CD Workflow

The implemented delivery process can be summarized as follows:

1. Developer pushes code to GitHub.
2. GitHub Actions triggers the CI workflows.
3. Application microservices are built.
4. Security scanning is performed using Gitleaks and Trivy.
5. Docker images are built.
6. Images are pushed to Docker Hub.
7. The self-hosted runner executes the Kubernetes deployment workflow.
8. The application is deployed to the Minikube cluster.
9. Kubernetes runs the application components.

## 9. Workflow Execution and Verification

The following GitHub Actions workflows were executed successfully:

| Workflow | Result |
|----------|--------|
| CI - Build Microservices | Successful |
| Security Scanning | Successful |
| Docker Build and Push | Successful |
| Deploy to Minikube | Successful |

The self-hosted runner service was also verified to be active.

Kubernetes deployment status was checked, and all four application components were confirmed in the Running state.

## 10. Project Structure

The repository contains the application source code, Docker configuration, Terraform infrastructure configuration, Kubernetes deployment files, and GitHub Actions workflows.

Main project components include:

- Application microservices
- Docker and Docker Compose configuration
- Terraform modules
- Kubernetes manifests
- GitHub Actions workflows
- README documentation

## 11. Project Achievements

The following tasks were implemented:

- Developed and organized a microservices-based application.
- Containerized application components using Docker.
- Configured Docker Compose for local application execution.
- Organized infrastructure configuration using Terraform modules.
- Validated Terraform configurations.
- Implemented automated CI workflows using GitHub Actions.
- Integrated Gitleaks for secret detection.
- Integrated Trivy for container security scanning.
- Automated Docker image building and publishing to Docker Hub.
- Configured a self-hosted GitHub Actions Runner.
- Set up a local Kubernetes environment using Minikube.
- Automated Kubernetes deployment through GitHub Actions.
- Verified successful execution of all implemented workflows.
- Verified that all application components were running in Kubernetes.

## 12. Implementation Scope and Future Improvements

The current implementation focuses on Docker-based application delivery, GitHub Actions automation, security scanning, Terraform validation, and Kubernetes deployment on Minikube.

The following technologies and tasks remain outside the completed implementation:

- Actual AWS infrastructure provisioning.
- Ansible configuration management.
- Jenkins-based CI/CD.
- ArgoCD-based GitOps deployment.

These can be considered future improvements to extend the project toward a complete cloud-based DevOps environment.

## 13. Conclusion

This project demonstrates the implementation of a DevOps environment covering application containerization, infrastructure provisioning configuration, automated CI/CD pipelines, security scanning, container image publishing, and Kubernetes deployment.

It brings together several DevOps tools and technologies to demonstrate an automated application delivery workflow, from building application services to deploying them in a Kubernetes cluster.

