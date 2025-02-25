# GamerChallenges

GamerChallenges est une plateforme dédiée aux passionnés de jeux vidéo et aux adeptes du challenge.

Inspiré par l’esprit de la communauté speedrun, GamerChallenges permet aux joueurs de proposer ou de relever des défis personnalisés sur le jeu vidéo de leur choix.

# Besoins et objectifs

- Aspect communautaire : besoin pour chaque joueur de retrouver d'autres personnes avec qui partager ses expériences.
- Aspect compétitif : les challenges entre joueurs peuvent relancer l'intérêt pour un jeu et créer de la rejouabilité.

# Fonctionnalités

## Besoins Fonctionnels - MVP

Page d'accueil : présentation de GamerChallenges, des défis populaires et des plus récents défis.

Système d'inscription et de connexion : gestion des utilisateurs.

Proposition de challenge : les utilisateurs peuvent soumettre des défis à réaliser.

Page de détail d'un challenge : description, règles et vidéos des participations

Votations : possibilité de voter pour les défis proposés et les meilleures participations.

Soumission de participations : les utilisateurs peuvent envoyer leurs vidéos pour prouver la réalisation des challenges.

Barre de recherche pour un jeu.

## Propositions d’évolutions possibles

Tableau des leaders : affichage des utilisateurs ayant réalisé le plus de défis et obtenu le plus de votes.

Filtres de recherche : par type de challenge, et par popularité.

Système de commentaires : les utilisateurs peuvent commenter les participations.

Système de récompenses : badges ou points pour les utilisateurs en fonction de leurs participations et votes.

# Liste des technologies utilisées

## Front :
  
- Vite est utilisé pour pouvoir construire de manière éfficace et optimiser les fichiers de la partie front-end envoyé au client (minification, diminution des requètes HTTP..)

- React sera utilisé pour faciliter la manipulation du DOM ainsi que pour les mêmes raisons de performance qui nous à poussaient à utiliser Vite.
  
- TypeScript va nous permettre d'anticiper des bugs en forçant un typage fort et donc passer moins de temps a débuger ainsi pourra nous permettre d'avoir une meilleure maintenabilité.
  
- Vanilla css principalement.
  
## Back :
  
- Node.js permet de créer des applications rapides et évolutives grâce à son moteur JavaScript performant et sa gestion asynchrone des requêtes.
  
- Express simplifie le développement d'applications web avec Node.js grâce à sa structure minimaliste et ses outils flexibles pour gérer les routes et les middlewares.
  
- PostgreSQL : on choisit un base de données SQL pour correspondre au typage fort de TypeScript côté Front et aux fortes contraintes de structure qu'on peut attendre d'une API REST.

- Sequelize : on choisit sequelize pour sa gestion fortes des types, sa gestion des relations et la sécurité.
  
## Déploiement :

- Nginx est parfaitement compatible avec Node.js, ayant été conçu pour fonctionner de manière optimale avec des applications JavaScript, ce qui en fait un choix idéal pour notre projet.

- VPS hébergeur IONOS qui va nous permettre de déployer l'application directement sur un serveur distant en se servant de l'interface Linux.

# Public ciblé

Des amateurs et/ou experts de jeux vidéos et de challenges plus ou moins décalés.

# Navigateurs compatibles

- Google Chrome
- Microsoft Edge

# Arborescence

```
index
    /profile
    /login
    /signup
    /contact
    /about
    /legals
    /error

    /games
    /games
        /:gameId

    /challenges
        /:challengeId
```

# Routes

`/` Voir la page d'accueil

`/profile` Accéder à la page de profil

`/login` Accéder à la page pour se connecter

`/signup` Accéder à la page pour s'inscrire

`/contact` Accéder à la page qui permet d'envoyer un mail à l'équipe de développement

`/about` Accéder à la page à propos de l'équipe

`/games` Voir la page de la liste de tous les jeux

`/games/:gameId` Voir la page d'un jeu spécifique

`/games/:gameId/:challengeId` Voir la page d'un challenge spécifique

## Back

### Root

`GET /api` obtenir une confirmation de connexion

### Players

`GET /api/players/:id` récupérer les infos d'un joueur

`POST /api/players` ajouter un nouveau player en spécifiant :\
{ name, email, password } dans le corps de requête

`PATCH /api/players/:id` modifier un player en spécifiant :\
{ name, email, password } dans le corps de requête

`DELETE /api/players/:id` supprimer un player

`POST /api/login` obtnir le token d'authenfication (jwt) \
au format { id , iat, exp } identifiant du joueur, heure d'émission, heure d'expiration

### Games

`GET /api/games` récupérer la liste des jeux

`GET /api/games/:id` récupérérer un jeu

### Challenges

`GET /api/challenges` récupérer la liste des challenges

`GET /api/challenges/:id` récupéerer un challenge

`GET /api/challenges/popular` récupérer les 5 challenges les plus populaires

`POST /api/challenges/` ajouter un challenge en spécifiant :\
{ game_id, name, description } dans le corps de requête

`PATCH /api/challenges/:id` modifier un challenge en spécifiant :\
{ name, description } dans le corps de requête

`DELETE /api/challenges/:id` supprimer un challenge

`PATCH /api/votechallenge` changer la valeur du vote d'un player pour un challenge en spécifiant { challenge_id } dans le corps de requête

### Propositions

`GET /api/propositions` récupérer la liste des propositions

`GET /api/propositions/:id` récupérer une proposition

`POST /api/propositions` ajouter une proposition en spécifiant :\
{ challenge_id, title, description, url_video } dans le corps de requête

`PATCH /api/propositions/:id` modifier une proposition en spécifiant :\
{ title, description, url_video } dans le corps de requête

`DELETE /api/propositions/:id` supprimer une proposition

`PATCH /api/voteprop` changer la valeur du vote d'un player pour une proposition en spécifiant { proposition_id } dans le corps de requête

# User stories

## Visiteur

En tant que visiteur, je veux accéder à la page d'accueil afin de voir les challenges en cours.

En tant que visiteur, je veux accéder à la page d'accueil afin de voir les challenges populaires.

En tant que visiteur, je veux accéder à la page signup afin de créer un compte.

En tant que visiteur, je veux accéder à la page login afin de me connecter à mon compte.

En tant que visiteur, je veux accéder à la page games afin de voir la liste des jeux.

En tant que visiteur, je veux accéder à la page d'un jeu spécifique afin de voir la liste des challenges de ce jeu (en cours, populaires, tous).

En tant que visiteur, je veux accéder à la page d'un challenge spécifique afin de voir la liste des vidéos soumises par les joueurs en tant que propositions.

## Utilisateur

En tant qu'utilisateur, je veux pouvoir me déconnecter.

En tant qu'utilisateur je veux pouvoir accéder à la page profil pour modifier mot de passe, modifier le pseudonyme.

En tant qu'utilisateur, je veux accéder à la page d'un jeu spécifique, pour créer un challenge, modifier  ou supprimer mes challenges.

En tant qu'utilisateur, je veux accéder à la page d'un challenge spécifique, pour faire une proposition, ou modifier la proposition que j'ai déjà faite, ou supprimer ma proposition.

En tant qu'utilisateur, je veux pouvoir voter pour/contre un challenge spécifique pour modifier sa popularité.

En tant qu'utilisateur, je veux pouvoir voter pour/contre une proposition pour modifier sa popularité.

# Roles

- Product Owner : Dylan Barillot
- Scrum Master : Axel Poncet
- Référent technique Git / Tech lead front : Lucas Pinte
- Tech Lead back : Nicolas Conan

# Dictionnaire des données

## Table : `player`

| **Attribut** | **Type** | **Description** | **Contraintes** |
| -------------|----------|-----------------|-----------------|
| id | Integer | Identifiant unique de l'utilisateur | PRIMARY KEY |
| name | Text | Nom de l'utilisateur | NOT NULL UNIQUE |
| email | Text | Email de l'utilisateur | NOT NULL UNIQUE |
| password | Text | Mot de passe de l'utilisateur | NOT NULL |
---

## Table : `game`

| **Attribut** | **Type** | **Description** | **Contraintes** |
|--------------|----------|-----------------|-----------------|
| id | Integer | Identifiant unique du jeu.                         | SERIAL PRIMARY KEY |
| name | Text | Nom du jeu | NOT NULL UNIQUE |
| date | Integer | Date de sortie du jeu (année) | NOT NULL |
| platform | Text | Plateforme du jeu | NOT NULL |
| picture | Text | URL de l'image associée au jeu. |       |
---

## Table : `challenge`

| **Attribut** | **Type** | **Description** | **Contraintes** |
|--------------|----------|-----------------|-----------------|
| id | Integer (PK) | Identifiant unique du challenge. |SERIAL PRIMARY KEY |
| user_id | Integer (FK) | Référence vers l'identifiant du créateur. | Doit exister dans `user` |
| game_id      | Integer (FK)  | Référence vers l'identifiant du jeu.               | Doit exister dans `game` |
| name         | Text          | Nom du challenge.                                  | NOT NULL UNIQUE             |
| description  | Text          | Description du challenge.                         |        |
| start_at     | Timestamp     | Date et heure de début du challenge.              | NOT NULL              |
| end_at       | Timestamp     | Date et heure de fin du challenge.                | NOT NULL              |
| url_video    | Text          | URL de la vidéo associée au challenge.            |        |

---

## Table : `proposition`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique de la proposition.              | SERIAL PRIMARY KEY          |
| challenge_id | Integer (FK)  | Référence vers l'identifiant du challenge.          | Doit exister dans `challenge` |
| user_id      | Integer (FK)  | Référence vers l'identifiant de l'utilisateur.      | Doit exister dans `user` |
| title        | Text          | Titre de la proposition.                           | NOT NULL              |
| description  | Text          | Description de la proposition.                     |          |
| url_video    | Text          | URL de la vidéo associée à la proposition.         |         |

---

## Table : `vote_challenge`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique du vote sur un challenge.        | SERIAL PRIMARY KEY          |
| challenge_id | Integer (FK)  | Référence vers l'identifiant du challenge voté.      | Doit exister dans `challenge` |
| user_id      | Integer (FK)  | Référence vers l'identifiant de l'utilisateur votant.| Doit exister dans `user` |
| value        | Boolean       | Valeur du vote (par exemple, positif ou négatif).    | NOT NULL               |

---

## Table : `vote_prop`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique du vote sur une proposition.     | SERIAL PRIMARY KEY           |
| prop_id      | Integer (FK)  | Référence vers l'identifiant de la proposition votée.| Doit exister dans `proposition` |
| user_id      | Integer (FK)  | Référence vers l'identifiant de l'utilisateur votant.| Doit exister dans `user` |
| value        | Boolean       | Valeur du vote (par exemple, positif ou négatif).    | NOT NULL              |

## Maquettes
[Lien vers les maquettes](https://www.figma.com/design/El2gmuO84Ogl4Ro5w9du4H/Maquette-gamerChallenges?node-id=0-1&p=f&t=8mmzxNxH1xVpjMaX-0)