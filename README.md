# racMart resume
This is my app multiplatform with my personal information and skills.

# Dar permisos de Internet
 <uses-permission android:name="android.permission.INTERNET"/>

# Dev
1. Copiar el .env.template y renombrarlo a .env

# Flujo de la Arquitectura Limpia
 UI: Tiene la comunicacion con la capa de presentacion
 Presentacion: Tiene providers o gestionadores de estado q terminan llamando los casos de uso
 Casos de Uso: Se comunica con los repositorios //NO SE HACE EN ESTE PROYECTO
 Repositorios y Datasources: Los repositorios llaman los datasources
 Informacion: Y luego la informacion regresa al UI.

# Pasos para hacer primer commit
1. git init
2. git add .
3. git commit -m "first commit"
4. git remote add origin https://github.com/NOMBRE_USUARIO/NOMBRE_PROYECTO.git
5. git push -u origin master

# Crear nueva rama y movernos a ella
1. git checkout -b branch_name

# Flutter Launcher Icons
1. pubspec assist flutter_launcher_icons
2. dart run flutter_launcher_icons

# Rename App
1. pubspec assist rename_app
2. dart run rename_app:main all="My App Name"

# Build
1. flutter build apk