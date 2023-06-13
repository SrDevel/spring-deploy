## Despliegue de apps Spring Boot en Fly.io

1. Crear cuenta en Fly.io usando GitHub
2. En el proyecto, en la rama principal del proyecto se crea un archivo llamado **Dockerfile**
3. En **Dockerfile** hacemos lo siguiente 
    1. Usar una imagen base con JDK 17 amazon coretto y Maven 3.9.2 
   **FROM maven:3.9.2-amazoncorretto-17 AS build**
   2. Crear directorio de trabajo 
      **WORKDIR /app**
   3. Copiar todos los archivos del proyecto al directorio de trabajo
      **COPY . /app**
   4. Ejecutamos el comando para compilar el proyecto
      **RUN mvn clean package**
   5. Crear una imagen base con JDK 17 amazon coretto 
      **FROM amazoncorretto:17**
   6. Exponer el puerto 8080
      **EXPOSE 8080**
   7. Copiar el archivo jar del proyecto al directorio de trabajo
      **COPY --from=build /app/target/spring-deploy-1.0.jar /app/spring-deploy-1.0.jar**
   8. Establecemos el punto de entrada para ejecutar el proyecto
      **ENTRYPOINT ["java", "-jar", "/app/spring-deploy-1.0.jar"]**
4. Abrimos una terminal (Preferiblemente donde tenemos el archivo Dockerfile)
5. Ejecutamos el comando **fly launch**
6. Elejimos las opciones que necesitemos
7. Corremos la aplicación
----
    