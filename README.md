

# CI/CD Pipeline with Jenkins for WeatherApp Deployment on EKS

## Introduction

This project establishes an end-to-end CI/CD pipeline facilitating continuous integration, testing, and deployment of the WeatherApp, a Flask-based web application that forecasts weather. The pipeline is automated using Jenkins and targets deployment on an Amazon EKS (Elastic Kubernetes Service) cluster. Helm charts are used to manage the application's deployment lifecycle, enabling a scalable and maintainable infrastructure.

## Features

- **CI/CD Pipeline**: Automated pipeline with Jenkins that integrates and deploys code changes.
- **Flask Web Application**: Backend application built with Flask to serve weather forecast data.
- **EKS Cluster Configuration**: Utilizes EKSCTL for provisioning and managing the EKS cluster.
- **Automated Deployment**: Utilizes Helm for streamlined and versioned deployments to Kubernetes.
- **Codebase on GitHub**: Source code is version-controlled and hosted on GitHub.

## CI/CD Infrastructure

The CI/CD pipeline is configured with robust infrastructure for efficient software delivery. It encompasses the practices and tools necessary to integrate code changes, execute comprehensive tests, and deploy them to the production environment securely and reliably.


## Pipeline Workflow

The Jenkins pipeline automates the deployment process with the following stages:

1. **Code Checkout**: Jenkins starts by pulling the latest changes from the GitHub repository to ensure the most recent code is used throughout the pipeline.

2. **Build**: The application is compiled or packaged, preparing it for the subsequent testing phase. This often includes building a Docker image from the source.

3. **Test**: Automated tests are run against the build to verify that the application behaves as expected. This ensures quality and detects any issues early.

4. **Docker Image Tagging**: On successful testing, the Docker image is tagged with an appropriate version tag or build number for identification and traceability.

5. **Docker Image Push**: The tagged Docker image is then pushed to a Docker registry such as DockerHub, making it available for deployment.

6. **Helm Chart Update**: The Helm chart is updated with the new Docker image tag, preparing it for the deployment to the Kubernetes cluster.

7. **Deployment**: Using Helm, the updated application is deployed to the EKS cluster. Helm ensures that the update is done with minimal downtime using strategies like a rolling update.

8. **Post-Deployment Test**: After deployment, a set of post-deployment tests are run to ensure that the application is functioning correctly in the live environment.

9. **Cleanup**: Finally, any temporary resources used during the build or deployment process are cleaned up to maintain a tidy CI/CD environment.


