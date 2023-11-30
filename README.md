# Repositorio de ejecución de pruebas para el proyecto de inventario
 - **Este README incluye Instrucciones para probar Sonarqube y aparte Instrucciones para levantar el sistema de inventarios y probarlo como usuario y usar OWASP ZAP**

# Instrucciones de uso para test de SonarQube

## Configuración con Docker

Sigue estos pasos para configurar y ejecutar tu entorno Docker:

1. **Clona el repositorio**: `git clone <REPO-URL>`

2. **Entrar a la carpeta del proyecto**: `cd ./Simple-Inventario-Duoc/`

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


## Referencias para configuración de SonarQube
  - Pasos de instalación local de Sonarqube (El Dockerfile se basa en el comando que proporciona la documentación, aunque para este caso se añade Node.js, que es requerido por SonarQube): [DOCUMENTACIÓN](https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/)
  - Instalar Node.js en linux por terminal: [DOCUMENTACIÓN](https://github.com/nodesource/distributions#installation-instructions)
  - Tutorial de SonarQube para Windows (Me sirvió pero adapte los pasos para linux y Docker): [VIDEO](https://www.youtube.com/watch?v=6pLj3KVglFA)

# Instrucciones de uso para levantar codigo fuente con Docker y testear la app con OWASP ZAP
Nota: No es necesario levantar el codigo fuente para ejecutar el analisis de SonarQube, pero sí si se desea levantar el codigo fuente para ver el proyecto y hacer otro tipo de test.

## Levantar contenedores
1. **Clona el repositorio**: `git clone <REPO-URL>`
2. **Moverse a carpeta del codigo fuente**: `cd ./Simple-Inventario-Duoc/Control/
3. **Levantar el codigo fuente con Docker Compose**: `docker compose up -d`
4. **Ingresar a la aplicación de inventario**: Navegar a `http://localhost:80/` y logearse con las credenciales `admin` y `admin`
1. **Ingresar a la aplicación de OWASP ZAP**: http://localhost:8080/zap
