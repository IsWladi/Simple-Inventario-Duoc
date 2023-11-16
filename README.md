- docker compose up -d
- docker ps
- docker exec -u root -it <CONTAINER ID OR CONTAINER NAME> /bin/bash
- cd ../../app/Control
- Generar el token en SonarQube
- /app/sonar-scanner-5.0.1.3006-linux/bin/sonar-scanner -Dsonar.login=<TOKEN> // probar -Dsonar.token=<TOKEN>
- esperar a que termine(referencia: 16 minutos)
- Nota: parece que requiere tener node instalado en el contenedor para algunas cosas, tratar de instalarlo en el contenedor.

## Reporte 16-11-2023
![image](https://github.com/IsWladi/Simple-Inventario-Duoc/assets/133131317/76ca9758-dc35-4a23-8f4c-8bdf57ddcdac)
![image](https://github.com/IsWladi/Simple-Inventario-Duoc/assets/133131317/b729089b-1a75-4b8c-bcb0-fd2f9cd7e247)

