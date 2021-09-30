**CLOUD DEVOPS - CAPSTONE PROJECT**

**Project Overview:**

In this project, utilized the knowledge and skills learned during Udacity's Cloud Devops Nanodegree Program. The goal of the project was to deploy an application to AWS using automation. 

**Deployment Strategy:**

Used Rolling Update strategy to deploy a React App to AWS EC2 and EKS.

**Environment Setup:**

1. Setup Jenkins master box on AWS EC2, installed plugins needed: BlueOcean, AWS CLI, Pipeline Steps, Docker/DockerHub, and created user credentials.
2. Connected Github with Jenkins to build integration.
3. Installed Docker to build images.
4. Setup DockerHub account to store image repositories.
5. Configured AWS CLI and EKSCTL to interact with AWS resources, KUBECTL to interact with and manage Kubernetes cluster.

**Project Tasks:**

1. Created Dockerfile to built docker image and containerize application.
2. Tested container using Docker and created shellscript to push image to Dockerhub.
3. Created Kubernetes deployment to configure PODs, and service to access Containers.
4. Used AWS Cloud Formation to create cluster in AWS EKS.
5. Created Jenkinsfile and implemented CI/CD pipeline using Jenkins. Added jobs to Build, Lint, Push and Deploy containers to Kubernetes cluster.

**Screenshots added to source:** 

1. Deploy ROlling Update.
2. Lint Failed.
3. Lint Passed.
