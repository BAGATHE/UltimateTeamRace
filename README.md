# React + TypeScript + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type-aware lint rules:

```js
export default tseslint.config({
  extends: [
    // Remove ...tseslint.configs.recommended and replace with this
    ...tseslint.configs.recommendedTypeChecked,
    // Alternatively, use this for stricter rules
    ...tseslint.configs.strictTypeChecked,
    // Optionally, add this for stylistic rules
    ...tseslint.configs.stylisticTypeChecked,
  ],
  languageOptions: {
    // other options...
    parserOptions: {
      project: ['./tsconfig.node.json', './tsconfig.app.json'],
      tsconfigRootDir: import.meta.dirname,
    },
  },
})
```

You can also install [eslint-plugin-react-x](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-x) and [eslint-plugin-react-dom](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-dom) for React-specific lint rules:

```js
// eslint.config.js
import reactX from 'eslint-plugin-react-x'
import reactDom from 'eslint-plugin-react-dom'

export default tseslint.config({
  plugins: {
    // Add the react-x and react-dom plugins
    'react-x': reactX,
    'react-dom': reactDom,
  },
  rules: {
    // other rules...
    // Enable its recommended typescript rules
    ...reactX.configs['recommended-typescript'].rules,
    ...reactDom.configs.recommended.rules,
  },
})
```
# UltimateTeamRace

# UltimateRace Frontend

Application frontend React 19 avec Vite pour le projet UltimateRace.

## Prérequis

- Docker et Docker Compose installés sur votre machine
- Node.js 22.14 (pour le développement local)
- Git

## Installation avec Docker

1. **Cloner le repository**
```bash
git clone [URL_DU_REPOSITORY]
cd ultimateRace-front
```

2. **Construire les images Docker**
```bash
docker compose build
```

## Utilisation

### Environnement de Développement

Pour lancer l'environnement de développement :
```bash
docker compose up dev
```

L'application sera disponible à l'adresse : [http://localhost:5173](http://localhost:5173)

### Environnement de Production

Pour lancer l'environnement de production :
```bash
docker compose up prod
```

L'application sera disponible à l'adresse : [http://localhost:80](http://localhost:80)

## Commandes Utiles

- **Arrêter les conteneurs** :
```bash
docker compose down
```

- **Voir les logs** :
```bash
docker compose logs -f [dev|prod]
```

- **Reconstruire les images** :
```bash
docker compose build
```

## Structure du Projet

```
ultimateRace-front/
├── Dockerfile          # Configuration pour l'image de production
├── Dockerfile.dev      # Configuration pour l'image de développement
├── docker-compose.yml  # Configuration des services Docker
├── nginx.conf         # Configuration du serveur Nginx
└── ...                # Autres fichiers du projet
```

## Configuration Docker

- **Développement** : Utilise Node.js 22.14 avec hot-reloading
- **Production** : Utilise Nginx pour servir les fichiers statiques
- **Ports** :
  - Développement : 5173
  - Production : 80

## Dépannage

Si vous rencontrez des problèmes :

1. **Vérifier les logs** :
```bash
docker compose logs -f [dev|prod]
```

2. **Vérifier l'état des conteneurs** :
```bash
docker ps
```

3. **Nettoyer les conteneurs et images** :
```bash
docker compose down
docker system prune -a
```

4. **Reconstruire depuis zéro** :
```bash
docker compose down
docker compose build --no-cache
docker compose up [dev|prod]
```
