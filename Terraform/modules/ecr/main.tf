resource "aws_ecr_repository" "microservices" {
  for_each = var.repository_names

  name                 = "${var.project_name}/${each.value}"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Project   = var.project_name
    Service   = each.value
    ManagedBy = "Terraform"
  }
}

resource "aws_ecr_lifecycle_policy" "microservices" {
  for_each = aws_ecr_repository.microservices

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only the latest 10 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
