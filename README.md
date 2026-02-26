# multi-container-app
project is to practice using Docker Compose to run a multi-container application in production. You will use Docker Compose to run a Node.js application and a MongoDB database.
https://roadmap.sh/projects/multi-container-service

Multi‑Container Todo API (Node.js + MongoDB + Docker Compose)
A fully containerized Todo API built with Node.js, Express, and MongoDB, orchestrated using Docker Compose.
This project also includes Terraform for provisioning a remote server, Ansible for configuration management, and a GitHub Actions CI/CD pipeline for automated deployments.
Bonus: optional Nginx reverse proxy for domain‑based access.

🚀 Features
- RESTful Todo API (CRUD)
- MongoDB persistence using Docker volumes
- Multi‑container setup with Docker Compose
- Infrastructure-as-Code using Terraform
- Automated server provisioning with Ansible
- CI/CD pipeline using GitHub Actions
- Optional Nginx reverse proxy for production

📁 Project Structure
.
├── api/
│   ├── index.js
│   ├── models/
│   ├── package.json
│   ├── Dockerfile
│   └── .env.example
├── docker-compose.yml
├── nginx/
│   ├── nginx.conf
│   └── Dockerfile (optional)
├── infra/
│   ├── terraform/
│   └── ansible/
└── .github/
    └── workflows/
        └── ci-cd.yml



🧩 API Endpoints
|  |  |  | 
|  | /todos |  | 
|  | /todos |  | 
|  | /todos/:id |  | 
|  | /todos/:id |  | 
|  | /todos/:id |  | 



🐳 Running Locally with Docker Compose
1. Clone the repository
git clone https://github.com/your-username/your-repo.git
cd your-repo


2. Create environment file
cp api/.env.example api/.env


3. Start the containers
docker compose up --build


4. Test the API
curl http://localhost:3000/todos


MongoDB data persists using the mongo-data Docker volume.

☁️ Infrastructure (Terraform + Ansible)
Terraform provisions:
- Cloud VM (AWS, DigitalOcean, etc.)
- Security groups / firewall rules
- SSH access
Ansible configures:
- Docker & Docker Compose
- Application directory structure
- Deployment of the API + MongoDB containers
- Optional Nginx reverse proxy
Run Terraform:
cd infra/terraform
terraform init
terraform apply


Run Ansible:
cd ../ansible
ansible-playbook -i inventory playbook.yml



🔄 CI/CD with GitHub Actions
This project includes a GitHub Actions workflow that:
- Builds and pushes the API Docker image to Docker Hub
- SSHs into the remote server
- Pulls the latest image
- Restarts the Docker Compose stack
Secrets required:
- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN
- SERVER_IP
- SERVER_USER
- SERVER_SSH_KEY

🌐 Optional: Nginx Reverse Proxy
To expose the API at:
http://your-domain.com


Enable the Nginx service in docker-compose.yml and configure DNS A‑record to point to your server.

🛠️ Tech Stack
- Node.js / Express
- MongoDB
- Docker & Docker Compose
- Terraform
- Ansible
- GitHub Actions
- Nginx (optional)

📜 License
This project is licensed under the MIT License.
MIT License
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

Copyright (c) 2026 Summer Davis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

🤝 Contributing
Pull requests are welcome!
If you submit this project on roadmap.sh, feel free to share your link so others can learn from your implementation.
