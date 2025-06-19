Este es un proyecto creado en colaboración para la clase de programación para la plataforma OSX, buscamos crear un programa en SwiftUI para MacOs donde se consulte el consumo de Apis mediante vapor, además de desplegar el proyecto en la nube.
Nosotros decidimos crear una aplicación pensada principalmente para dispositivos móviles a la que llamamos “GameVault” esta es una aplicación orientada a videojuegos, funcionando a manera de wiki, en ella es posible verificar la información correspondiente a una variedad de videojuegos mediante género o búsqueda directa, también con la posibilidad de checar información sobre varias compañías de videojuegos.

Integrantes:
•	Ángel David Onesto Frías
•	Marcos Ariciaga Valdez
•	Giorgio Lissandro Tellez Barron
•	Samuel Yoshua Guzmán Gutiérrez
•	Guillermo Hernández Pérez

Enlaces a los repositorios públicos
Frontend (SwiftUI - macOS):
  [https://github.com/SinckCode/gameVault](https://github.com/SinckCode/gameVault)

Backend (API REST con Vapor):  
  [https://github.com/SinckCode/gameVault-Api](https://github.com/SinckCode/gameVault-Api)

URL de la API desplegada:
La API fue desarrollada en Vapor y desplegada en DigitalOcean:
Videojuegos:  
  [https://whale-app-f76gv.ondigitalocean.app/videojuegos](https://whale-app-f76gv.ondigitalocean.app/videojuegos)

Empresas:  
  [https://whale-app-f76gv.ondigitalocean.app/companies](https://whale-app-f76gv.ondigitalocean.app/companies)

Instrucciones para probar el proyecto:

Requisitos:
- macOS con *Xcode* instalado
- *Swift 5 o superior*
- Conexión a internet activa
Pasos para probar el proyecto:
1. Clona el repositorio del frontend:
   ```bash
   git clone https://github.com/SinckCode/gameVault.git

2. Abre el proyecto en Xcode:
open gameVault.xcodeproj
3. Ejecuta en el simulador de macOS o en tu Mac local.
4. La app se conectará automáticamente a la API para cargar los datos en tiempo real.
