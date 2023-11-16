# Instrucciones de Uso

Este documento proporciona los pasos necesarios para trabajar con Docker y SonarQube.

## Configuración con Docker

Sigue estos pasos para configurar y ejecutar tu entorno Docker:

1. **Construir y iniciar contenedor con Docker Compose**: `docker compose up -d`

2. **Verificar Contenedores en Ejecución**: `docker ps`

3. **Acceder al Contenedor**: `docker exec -u root -it <CONTAINER ID OR CONTAINER NAME> /bin/bash`
- Nota: Reemplaza `<CONTAINER ID OR CONTAINER NAME>` con el ID o nombre de tu contenedor obtenido con `docker ps`.

4. **Navegar al directorio del proyecto dentro del container**: `cd ../../app/Control`



## Configuración de SonarQube

Para configurar SonarQube y ejecutar un análisis de código, sigue estos pasos:

1. **Generar Token en SonarQube**:
- Ingresa a SonarQube en `http://localhost:9000` (Esperar a que termine de iniciarse SonarQube en el container).
- Ingresa con las credenciales `admin` y `admin` y sigue los pasos.
- Ve a `My Account -> Security`.
- Selecciona `Generate Tokens`.
- Ingresa `token-duoc-test` en `Name` (el nombre no es relevante).
- Haz clic en `Generar token`.
- Copia el token generado.

2. **Ejecutar Análisis de SonarQube**:
- `/app/sonar-scanner-5.0.1.3006-linux/bin/sonar-scanner -Dsonar.login=<TOKEN>`
- Nota: Reemplaza `<TOKEN>` con el token generado.
- Nota: El análisis puede tardar aprox 16 minutos.
