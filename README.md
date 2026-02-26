# multi-container-app

Practice project using Docker Compose to run a multi-container application in production — a Node.js Todo API backed by MongoDB, reverse-proxied by Nginx.

## Stack

| Component | Technology |
|-----------|-----------|
| API       | Node.js (Express) + Mongoose |
| Database  | MongoDB 6 |
| Proxy     | Nginx |
| IaC       | Terraform (DigitalOcean) |
| Config    | Ansible |
| CI/CD     | GitHub Actions |

## API Endpoints

| Method | Endpoint       | Description            |
|--------|---------------|------------------------|
| GET    | /todos        | Get all todos          |
| POST   | /todos        | Create a new todo      |
| GET    | /todos/:id    | Get a single todo      |
| PUT    | /todos/:id    | Update a single todo   |
| DELETE | /todos/:id    | Delete a single todo   |

## Running Locally

```bash
# Build and start all containers (API, MongoDB, Nginx)
docker compose up --build

# API is available at http://localhost:3000
# Via Nginx reverse proxy at http://localhost:80
```

Data is persisted in a Docker named volume (`mongo-data`) so it survives container restarts.

## Project Structure

```
.
├── app/                   # Node.js API source + Dockerfile
│   ├── src/
│   │   ├── index.js       # Express server entry point
│   │   ├── models/
│   │   │   └── todo.js    # Mongoose Todo model
│   │   └── routes/
│   │       └── todos.js   # CRUD route handlers
│   ├── Dockerfile
│   └── package.json
├── nginx/
│   └── nginx.conf         # Nginx reverse proxy config
├── terraform/
│   └── main.tf            # DigitalOcean Droplet provisioning
├── ansible/
│   ├── playbook.yml       # Server configuration (Docker + app deploy)
│   └── inventory.ini      # Ansible inventory (update with your server IP)
├── .github/workflows/
│   └── deploy.yml         # GitHub Actions CI/CD pipeline
└── docker-compose.yml
```

## Deployment

### 1. Provision the server with Terraform

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your DigitalOcean token and SSH key fingerprint
terraform init
terraform apply
```

### 2. Configure the server with Ansible

```bash
cd ansible
# Update inventory.ini with the server IP from Terraform output
ansible-playbook -i inventory.ini playbook.yml
```

### 3. CI/CD with GitHub Actions

Add the following secrets to your GitHub repository:

| Secret               | Description                        |
|---------------------|------------------------------------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username           |
| `DOCKERHUB_TOKEN`    | Docker Hub access token            |
| `SERVER_HOST`        | Production server IP address       |
| `SERVER_USER`        | SSH username (e.g. `root`)         |
| `SERVER_SSH_KEY`     | Private SSH key for the server     |

Every push to `main` will build and push the Docker image, then deploy it to the server.
