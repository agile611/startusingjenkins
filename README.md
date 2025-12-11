[![Agile611](https://www.agile611.com/wp-content/uploads/2020/09/cropped-logo-header.png)](http://www.agile611.com/)

# Agile611 Jenkins CI/CD Training

Este repositorio ofrece scripts y una configuración mínima para levantar un entorno de Jenkins de prueba local usando Vagrant.

**Objetivo:** Proporcionar un punto de partida sencillo para probar Jenkins (y opcionalmente SonarQube) en entornos locales y educativos de CI.

**Requisitos:**
- macOS, Linux o Windows con compatibilidad para Docker o Vagrant
- Permisos de ejecución para los scripts (`chmod +x *.sh`)
- **git**: Necesario para clonar el repositorio
- **Vagrant**: Este repositorio utiliza una caja Vagrant basada en Ubuntu y se utilizará APT.
- **Virtualbox**: Es el motor para virtualizar el entorno.

**Estructura del repositorio:**
- `docker.sh` — script para arrancar servicios con Docker
- `jenkins.sh` — script de ayuda para gestionar Jenkins (arrancar, detener, acceder)
- `sonarqube.sh` — script para arrancar SonarQube (opcional)
- `Vagrantfile` — definición para crear una VM con Vagrant que instala Jenkins

**Inicio rápido (Vagrant)**

1) Instala Vagrant y VirtualBox.
2) Inicia la VM definida en el `Vagrantfile`:

```bash
vagrant up
vagrant ssh jenkins
# dentro de la VM, sigue las instrucciones del Vagrantfile o de los scripts
```

**Descripción breve de los scripts:**
- `docker.sh`: crea y gestiona contenedores (Jenkins, posiblemente SonarQube u otros servicios). Revisa su contenido para ajustar puertos y volúmenes.
- `jenkins.sh`: utilidades para obtener la URL de acceso, el usuario inicial y los secrets.
- `sonarqube.sh`: arranca SonarQube en modo desarrollo para escaneos locales.
- `Vagrantfile`: configura una máquina virtual con una instalación mínima para ejecutar Jenkins sin Docker.

**Puertos por defecto (configurables):**
- Jenkins: 8080
- SonarQube: 9000

## Resolución de problemas
- Si un puerto está ocupado, modifica la configuración del script o libera el puerto.
- Comprueba permisos: `chmod +x *.sh`.
- Revisa logs de los contenedores con `docker logs <container>` o entra con `vagrant ssh` y consulta los logs dentro de la VM.

## Contribuir 
- Abre un issue para proponer mejoras o reportar bugs.
- Haz fork y envía pull requests con cambios pequeños y bien documentados.

## Solución de problemas

Si encuentras problemas al aprovisionar la caja, puedes descargarla directamente y añadirla a Vagrant.

## Problemas comunes de red

Si tienes proxies o VPNs activos en tu equipo, es posible que Vagrant no pueda aprovisionar el entorno.

Comprueba tu conectividad previamente.

## Licencia

Este proyecto está publicado bajo la licencia MIT. Modifica según tus necesidades.

Este tutorial ha sido publicado por [Agile611](http://www.agile611.com/) bajo la licencia Creative Commons Atribución-NoComercial 4.0 Internacional.

[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC_BY--NC_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/4.0/)


Este `README` fue originalmente escrito por [Guillem Hernández Sola](https://www.linkedin.com/in/guillemhs/) y también se publica en el dominio público.

Contacta con Agile611 para más detalles.
- [Agile611](http://www.agile611.com/)
- Laureà Miró 309
- 08950 Esplugues de Llobregat (Barcelona)