# test_devops_ssr


# Construye la imagen Docker
docker build -t app .

# Corre el contenedor Docker localmente
docker run -p 80:80 app

# ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin (https://github.com/JulianPiedrahita/test_devops_ssr/tree/Develop/app)

# Etiquetas y push image
docker tag app:latest (https://github.com/JulianPiedrahita/test_devops_ssr/tree/Develop/app):latest
docker push (https://github.com/JulianPiedrahita/test_devops_ssr/tree/Develop/app):latest



# Inicializa el entorno de Terraform
terraform init

# Revisa el plan de Terraform
terraform plan

# Aplica el plan de Terraform
terraform apply

# variables utilizadas en el pipeline
$(ecrRepoName) : nombre del repositorio que contiene la imagen en aws
$(imageTag) : tag creada para la imagen
$(awsRegion) : debe contener ls region en la cual se tiene creada la infraestructura "us-east-1"
$(AWS_ACCESS_KEY_ID) : contiene la key_id  de acceso proporsionada por aws
$(AWS_SECRET_ACCESS_KEY) : contiene la acces_key  de acceso proporsionada por aws
$(ENVIRONMENT) : variable que determina la rama a desplegar

