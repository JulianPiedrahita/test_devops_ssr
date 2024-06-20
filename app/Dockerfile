# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de requerimientos y los instala
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copia el resto de los archivos de la aplicación
COPY . .

# Expone el puerto 80
EXPOSE 81

# Define el comando para correr la aplicación
CMD ["python", "app.py"]
