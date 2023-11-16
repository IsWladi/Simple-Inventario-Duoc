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
    - En `Type` selecciona `User Token`
    - Haz clic en `Generar token`.
    - Copia el token generado.

2. **Ejecutar Análisis de SonarQube**:
    - Dentro del conenedor (ref; paso 3 y 4) ejecutar `/app/sonar-scanner-5.0.1.3006-linux/bin/sonar-scanner -Dsonar.login=<TOKEN>`
    - Nota: Reemplaza `<TOKEN>` con el token generado en el paso anterior.
    - Nota: El análisis puede tardar aprox 16 minutos.
    - Cuando el proceso haya terminado puedes ver el reporte del analisis en `http://localhost:9000`


# Referencias
  - Pasos de instalación local de Sonarqube (El Dockerfile se basa en el comando que proporciona la documentación, aunque para este caso se añade Node.js, que es requerido por SonarQube): [DOCUMENTACIÓN](https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/)
  - Instalar Node.js en linux por terminal: [DOCUMENTACIÓN](https://github.com/nodesource/distributions#installation-instructions)
  - Tutorial de SonarQube para Windows (Me sirvió pero adapte los pasos para linux y Docker): [VIDEO](https://www.youtube.com/watch?v=6pLj3KVglFA)
