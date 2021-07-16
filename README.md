# GROUPOMANIA

Un réseau social interne d'entreprise, moderne et ludique.


![Logo](https://github.com/CarolineSenes/SENESCaroline_7_17062021/blob/master/frontend/src/assets/icon-above-font.png)

    
## Tech Stack

**Client:**
![VueJs](https://img.shields.io/badge/vuejs-%2335495e.svg?style=for-the-badge&logo=vue-dot-js&logoColor=%234FC08D)
![Vuetify](https://img.shields.io/badge/vuetify-%238DD6F9.svg?style=for-the-badge&logo=&logoColor=black)

**Server:**
![Node](https://img.shields.io/badge/node.js-%2343853D.svg?style=for-the-badge&logo=node-dot-js&logoColor=white)
![Express](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![mysql](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)



  
## Fonctionnalités

- création/déconnexion, modification, suppression d'un compte utilisateur
- création, modification, suppression de messages
- persistance des données
- rôles : utilisateur et administrateur
- mot de passe sécurisé
- responsive mobile et tablette
- normes d'accessibilité WCAG

  
## Screenshots

![App Screenshot](https://github.com/CarolineSenes/SENESCaroline_7_17062021/blob/master/imgReadme/visuels_groupomania.jpg)

  
## Installation
### Backend

```bash
  cd backend
  npm install
```

Créer un fichier .env dans le dossier du backend en ajoutant vos informations de connexion à la base de données :

```bash
  JWT_TOKEN= votre_secret_token
  DB_USERNAME = root
  DB_PASSWORD = password
  DB_DATABASE = nom_database
  DB_HOST = localhost
```

Créer la base de données et faire les migrations :

```bash
  npx sequelize-cli db:create
  npx sequelize-cli db:migrate
  npm run dev
```

(optionnel, si vous avez créé des seeders :)

```bash
  npx sequelize-cli db:seed:all
```

Lancer le backend :

```bash
  npm run dev
```

### Frontend

```bash
  npm install
  npm run serve
```
Mot de passe utilisateur/admin : test1234!