**Estructura del Proyecto**
---------------------------

### **Archivos y Carpetas Principales**

1.  **[app.js]**\
    Es el punto de entrada de la aplicación. Configura el servidor Express, carga las rutas y define middlewares para manejar errores y solicitudes entrantes.

2.  **[config]**\
    Contiene configuraciones relacionadas con la base de datos:

    -   **[db.js]**: Configura un pool de conexiones a la base de datos MySQL utilizando variables de entorno.
3.  **[controllers]**\
    Contiene los controladores que manejan la lógica de negocio para cada entidad. Cada archivo en esta carpeta corresponde a una entidad específica:

    -   **[antecedentesAcademicosController.js]**: Gestiona antecedentes académicos.
    -   **[ancetecentesLaboralController.js]**: Gestiona antecedentes laborales.
    -   **[ofertaLaboralController.js]**: Gestiona ofertas laborales.
    -   **[postulacionController.js]**: Gestiona postulaciones.
    -   **[usuarioController.js]**: Gestiona usuarios.
4.  **[models]**\
    Contiene los modelos que interactúan directamente con la base de datos. Cada archivo define las operaciones CRUD para una entidad específica:

    -   **`antecedentesAcademicos.js`**: Modelo para antecedentes académicos.
    -   **`antecedentesLaboral.js`**: Modelo para antecedentes laborales.
    -   **`ofertaLaboral.js`**: Modelo para ofertas laborales.
    -   **[postulacion.js]**: Modelo para postulaciones.
    -   **[usuario.js]**: Modelo para usuarios.
    -   **[utilsModels.js]**: Contiene funciones auxiliares, como el inicio de sesión.
5.  **[routers]**\
    Define las rutas de la API para cada entidad. Cada archivo asocia las rutas HTTP con los métodos correspondientes en los controladores:

    -   **`antecedentesAcademicos.js`**: Rutas para antecedentes académicos.
    -   **`antecedentesLaborales.js`**: Rutas para antecedentes laborales.
    -   **`ofertaLaboral.js`**: Rutas para ofertas laborales.
    -   **[postulacion.js]**: Rutas para postulaciones.
    -   **[usuario.js]**: Rutas para usuarios.
    -   **`index.js`**: Archivo principal que centraliza todas las rutas.
6.  **[utils]**\
    Carpeta destinada a utilidades generales. Actualmente no contiene archivos relevantes.

7.  **`.env`**\
    Archivo de configuración para las variables de entorno, como las credenciales de la base de datos.

8.  **`.vscode/settings.json`**\
    Configuración específica para el entorno de desarrollo en Visual Studio Code.

9.  **`package.json`**\
    Contiene las dependencias del proyecto y los scripts de inicio.

10. **`README.md`**\
    Archivo de documentación del proyecto.

* * * * *

**Flujo de Trabajo**
--------------------

1.  **Rutas ([routers])**\
    Las rutas definen los endpoints de la API y delegan las solicitudes a los controladores correspondientes.

2.  **Controladores ([controllers])**\
    Los controladores contienen la lógica de negocio. Reciben las solicitudes desde las rutas, interactúan con los modelos y devuelven las respuestas al cliente.

3.  **Modelos ([models])**\
    Los modelos interactúan directamente con la base de datos MySQL para realizar operaciones CRUD.

4.  **Base de Datos**\
    La conexión a la base de datos se gestiona mediante un pool de conexiones definido en [db.js].

* * * * *


**Dependencias Principales**
----------------------------

-   **Express**: Framework para construir el servidor.
-   **MySQL2**: Cliente para interactuar con la base de datos MySQL.
-   **dotenv**: Para gestionar variables de entorno.
-   **body-parser**: Middleware para analizar el cuerpo de las solicitudes.


**Estructura de la Carpeta [controllers](vscode-file://vscode-app/app/extra/vscode/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html)**
---------------------------------------------------------------------------------------------------------------------------------------------------------

Cada archivo en esta carpeta corresponde a una entidad específica del sistema y contiene métodos que implementan la lógica de negocio para esa entidad. A continuación, se describe la estructura y funcionalidad general de los controladores:

### **1\. Archivos de Controladores**

-   **`antecedentesAcademicosController.js`**\
    Controlador para gestionar los antecedentes académicos. Contiene métodos como [getAll], [create], [update] y [remove] para realizar operaciones CRUD sobre los antecedentes académicos.

-   **`ancetecentesLaboralController.js`**\
    Controlador para gestionar los antecedentes laborales. Similar al anterior, implementa métodos para realizar operaciones CRUD sobre los antecedentes laborales.

-   **`ofertaLaboralController.js`**\
    Controlador para gestionar las ofertas laborales. Permite crear, actualizar, eliminar y listar ofertas laborales.

-   **`postulacionController.js`**\
    Controlador para gestionar las postulaciones. Maneja la lógica para registrar postulaciones, actualizarlas, eliminarlas y listarlas.

-   **`usuarioController.js`**\
    Controlador para gestionar los usuarios. Contiene métodos para registrar usuarios, iniciar sesión, actualizar información de usuario y eliminar cuentas.

* * * * *

**Estructura de un Controlador**
--------------------------------

Cada controlador sigue una estructura similar, que incluye:

1.  **Importación del Modelo**\
    Cada controlador importa el modelo correspondiente para interactuar con la base de datos. Por ejemplo:

    const AntecentesLaboral = require('../models/antecedentesLaboral');

2.  **Definición de Métodos**\
    Los métodos principales suelen ser:

    -   **[getAll]**: Recupera todos los registros de la entidad.
    -   **[create]**: Crea un nuevo registro en la base de datos.
    -   **[update]**: Actualiza un registro existente.
    -   **[remove]**: Elimina un registro.


3.  **Manejo de Errores**\
    Cada método incluye un bloque `try-catch` para manejar errores y devolver respuestas



### **Documentación de la Carpeta [models]

La carpeta [models](vscode-file://vscode-app/app/extra/vscode/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) contiene los modelos de datos del proyecto. Los modelos son responsables de interactuar directamente con la base de datos, ejecutando consultas SQL para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar). Cada archivo en esta carpeta representa una entidad específica del sistema.

* * * * *

### **Estructura de la Carpeta [models]**

1.  **`antecedentesAcademicos.js`**\
    Modelo para gestionar los antecedentes académicos de los candidatos.

2.  **`antecedentesLaboral.js`**\
    Modelo para gestionar los antecedentes laborales de los candidatos.

3.  **`ofertaLaboral.js`**\
    Modelo para gestionar las ofertas laborales publicadas por las empresas.

4.  **`postulacion.js`**\
    Modelo para gestionar las postulaciones de los candidatos a las ofertas laborales.

5.  **`usuario.js`**\
    Modelo para gestionar los datos de los usuarios del sistema.

6.  **`utilsModels.js`**\
    Contiene funciones auxiliares para operaciones comunes, como el inicio de sesión o validaciones.

* * * * *

### **Descripción de los Modelos**

#### **1\. [antecedentesAcademicos.js]

-   **Propósito:** Gestionar los antecedentes académicos de los candidatos.
-   **Funciones principales:**
    -   [getAll]: Recupera todos los antecedentes académicos de la base de datos.
    -   [create]: Inserta un nuevo antecedente académico.
    -   [update]: Actualiza un antecedente académico existente.
    -   [remove]: Elimina un antecedente académico.

#### **2\. `antecedentesLaboral.js`**

-   **Propósito:** Gestionar los antecedentes laborales de los candidatos.
-   **Funciones principales:**
    -   [getAll]: Recupera todos los antecedentes laborales.
    -   [create]: Inserta un nuevo antecedente laboral.
    -   [update]: Actualiza un antecedente laboral existente.
    -   [remove]: Elimina un antecedente laboral.

#### **3\. `ofertaLaboral.js`**

-   **Propósito:** Gestionar las ofertas laborales publicadas por las empresas.
-   **Funciones principales:**
    -   [getAll]: Recupera todas las ofertas laborales.
    -   [create]: Inserta una nueva oferta laboral.
    -   [update]: Actualiza una oferta laboral existente.
    -   [remove]: Elimina una oferta laboral.

#### **4\. `postulacion.js`**

-   **Propósito:** Gestionar las postulaciones de los candidatos.
-   **Funciones principales:**
    -   [getAll]: Recupera todas las postulaciones.
    -   [create]: Inserta una nueva postulación.
    -   [update]: Actualiza una postulación existente.
    -   [remove]: Elimina una postulación.

#### **5\. `usuario.js`**

-   **Propósito:** Gestionar los datos de los usuarios del sistema.
-   **Funciones principales:**
    -   [getAll]: Recupera todos los usuarios.
    -   [create]: Inserta un nuevo usuario.
    -   [update]: Actualiza un usuario existente.
    -   [remove]: Elimina un usuario.

#### **6\. `utilsModels.js`**

-   **Propósito:** Proveer funciones auxiliares para operaciones comunes.
-   **Funciones principales:**
    -   `login`: Valida las credenciales de un usuario.
    -   Funciones adicionales para validaciones o consultas específicas.

* * * * *

### **Flujo de Trabajo de los Modelos**

1.  **Recepción de Datos:** Los modelos reciben datos desde los controladores.
2.  **Ejecución de Consultas SQL:** Utilizan el cliente MySQL (configurado en [db.js]) para ejecutar consultas SQL.
3.  **Devolución de Resultados:** Devuelven los resultados de las consultas al controlador correspondiente.


### **Documentación de la Carpeta

routers

**

La carpeta routers contiene los archivos que definen las rutas de la API del backend. Estas rutas son los puntos de entrada para que los clientes (como aplicaciones frontend o herramientas de prueba como Postman) interactúen con el sistema. Cada archivo en esta carpeta está asociado a una entidad específica y delega las solicitudes a los controladores correspondientes.

---

### **Estructura de la Carpeta

routers

**

1\. **`antecedentesAcademicos.js`**  

   Define las rutas relacionadas con los antecedentes académicos.

2\. **`antecedentesLaborales.js`**  

   Define las rutas relacionadas con los antecedentes laborales.

3\. **`ofertaLaboral.js`**  

   Define las rutas relacionadas con las ofertas laborales.

4\. **`postulacion.js`**  

   Define las rutas relacionadas con las postulaciones.

5\. **`usuario.js`**  

   Define las rutas relacionadas con los usuarios.

6\. **`index.js`**  

   Archivo principal que centraliza todas las rutas y las exporta para ser utilizadas en el archivo principal del servidor (`app.js`).

---

### **Descripción de las Rutas**

#### **1.

antecedentesAcademicos.js

**

- **Propósito:** Gestionar las rutas para los antecedentes académicos.

- **Rutas principales:**

  - `GET /`: Recupera todos los antecedentes académicos.

  - `POST /create`: Crea un nuevo antecedente académico.

  - `PUT /update`: Actualiza un antecedente académico existente.

  - `DELETE /remove`: Elimina un antecedente académico.

#### **2. `antecedentesLaborales.js`**

- **Propósito:** Gestionar las rutas para los antecedentes laborales.

- **Rutas principales:**

  - `GET /`: Recupera todos los antecedentes laborales.

  - `POST /create`: Crea un nuevo antecedente laboral.

  - `PUT /update`: Actualiza un antecedente laboral existente.

  - `DELETE /remove`: Elimina un antecedente laboral.

#### **3. `ofertaLaboral.js`**

- **Propósito:** Gestionar las rutas para las ofertas laborales.

- **Rutas principales:**

  - `GET /`: Recupera todas las ofertas laborales.

  - `POST /create`: Crea una nueva oferta laboral.

  - `PUT /update`: Actualiza una oferta laboral existente.

  - `DELETE /remove`: Elimina una oferta laboral.

#### **4. `postulacion.js`**

- **Propósito:** Gestionar las rutas para las postulaciones.

- **Rutas principales:**

  - `GET /`: Recupera todas las postulaciones.

  - `POST /create`: Crea una nueva postulación.

  - `PUT /update`: Actualiza una postulación existente.

  - `DELETE /remove`: Elimina una postulación.

#### **5. `usuario.js`**

- **Propósito:** Gestionar las rutas para los usuarios.

- **Rutas principales:**

  - `GET /`: Recupera todos los usuarios.

  - `POST /create`: Crea un nuevo usuario.

  - `PUT /update`: Actualiza un usuario existente.

  - `DELETE /remove`: Elimina un usuario.

#### **6. `index.js`**

- **Propósito:** Centralizar todas las rutas del sistema.

- **Funcionalidad:** Importa las rutas de cada entidad y las asocia a un prefijo de ruta. Por ejemplo:

  - `/api/antecedentesAcademicos` para las rutas de antecedentes académicos.

  - `/api/usuarios` para las rutas de usuarios.

---

### **Flujo de Trabajo de las Rutas**

1\. **Recepción de Solicitudes:** Las rutas reciben las solicitudes HTTP desde el cliente.

2\. **Delegación a los Controladores:** Cada ruta llama al método correspondiente del controlador asociado.

3\. **Respuesta al Cliente:** El controlador procesa la solicitud y devuelve una respuesta al cliente a través de la ruta.

---

### **Ejemplo de Uso:

antecedentesAcademicos.js

**

```javascript

const express = require('express');

const router = express.Router();

const antecedentesAcademicosController = require('../controllers/antecedentesAcademicosController');

// Rutas para la API de antecedentes académicos

router.get('/', (req, res) => {

   antecedentesAcademicosController.getAll(req, res);

});

router.post('/create', (req, res) => {

   antecedentesAcademicosController.create(req, res);

});

router.put('/update', (req, res) => {

   antecedentesAcademicosController.update(req, res);

});

router.delete('/remove', (req, res) => {

   antecedentesAcademicosController.remove(req, res);

});

module.exports = router;

```

---

### **Conclusión**

La carpeta routers organiza las rutas de la API de manera modular, lo que facilita la escalabilidad y el mantenimiento del proyecto. Cada archivo se encarga de una entidad específica, asegurando una separación clara de responsabilidades. Además, el archivo `index.js` centraliza todas las rutas, simplificando su integración en el servidor principal.