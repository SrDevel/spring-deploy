# Usar una imagen base con JDK 17 amazon coretto y Maven 3.9.2
FROM maven:3.9.2-amazoncorretto-17 AS build

# Crear directorio de trabajo
WORKDIR /app

# Copiar todos los archivos del proyecto al directorio de trabajo
COPY . /app

# Ejecutamos el comando para compilar el proyecto
RUN mvn clean package

# Crear una imagen base con JDK 17 amazon coretto
FROM amazoncorretto:17

# Exponer el puerto 8080
EXPOSE 8080

# Copiar el archivo jar del proyecto al directorio de trabajo
COPY --from=build /app/target/spring-deploy-1.0.jar /app/spring-deploy-1.0.jar

# Establecemos el punto de entrada para ejecutar el proyecto
ENTRYPOINT ["java", "-jar", "/app/spring-deploy-1.0.jar"]
