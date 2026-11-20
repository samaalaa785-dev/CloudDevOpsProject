variable "project_name" {
  description = "Project name"
  type        = string
}

variable "repository_names" {
  description = "Microservice ECR repository names"
  type        = set(string)

  default = [
    "auth-service",
    "frontend",
    "roadmap-service"
  ]
}

variable "image_tag_mutability" {
  description = "Image tag mutability"
  type        = string
  default     = "IMMUTABLE"
}
