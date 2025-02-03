# GamerChallenges

GamerChallenges est une plateforme dédiée aux passionnés de jeux vidéo et aux adeptes du challenge.

Inspiré par l’esprit de la communauté speedrun, GamerChallenges permet aux joueurs de proposer ou de relever des défis personnalisés sur le jeu vidéo de leur choix.

# Besoins et objectifs

- Aspect communautaire : besoin pour chaque joueur de retrouver d'autres personnes avec qui partager ses expériences.
- Aspect compétitif : les challenges entre joueurs peuvent relancer l'intérêt pour un jeu et créer de la rejouabilité.

# Fonctionnalités

## Besoins Fonctionnels - MVP

Page d'accueil : présentation de GamerChallenges, des défis en cours et populaires.

Système d'inscription et de connexion : gestion des utilisateurs.

Proposition de challenge : les utilisateurs peuvent soumettre des défis à réaliser.

Page de détail d'un challenge : description, règles et vidéos des participations

Votations : possibilité de voter pour les défis proposés et les meilleures participations.

Soumission de participations : les utilisateurs peuvent envoyer leurs vidéos pour prouver la réalisation des challenges.

Tableau des leaders : affichage des utilisateurs ayant réalisé le plus de défis et obtenu le plus de votes.

Filtres de recherche : par jeux.

## Propositions d’évolutions possibles

Filtres de recherche : par type de challenge, et par popularité.

Système de commentaires : les utilisateurs peuvent commenter les participations.

Système de récompenses : badges ou points pour les utilisateurs en fonction de leurs participations et votes.

# Liste des technologies utilisées

- Front : Vite, React, TypeScript, Tailwind
- Back : Node.js, express, postgreSQL
- Déploiement : nginx, VPS (hébergeur)

# Public ciblé

Des amateurs et/ou experts de jeux vidéos et de challenges plus ou moins décalés.

# Navigateurs compatibles

- Google Chrome
- Microsoft Edge

# Arborescence

```
index
    /signup
    /login
    /games
        /games/:gameId
            /:challengeId
```

# Routes

`/` Voir la page d'accueil
`/signup` Accéder à la page pour s'inscrire
`/login` Accéder à la page pour se connecter
`/profile` Accéder à la page de profil

`/games` Voir la page de la liste de tous les jeux
`/games/:game` Voir la page d'un jeu spécifique
`/games/:game/:challenge` Voir la page d'un challenge spécifique


## Back

`/api/games`
`/api/games/:game`
`/api/games/:game/:challenge`

# User stories

En tant que visiteur, je veux accéder à la page d'accueil afin de voir les challenges en cours.
En tant que visiteur, je veux accéder à la page d'accueil afin de voir les challenges populaires.
En tant que visiteur, je veux accéder à la page signup afin de créer un compte.
En tant que visiteur, je veux accéder à la page login afin de me connecter à mon compte.

En tant que visiteur, je veux accéder à la page games afin de voir la liste des jeux.
En tant que visiteur, je veux accéder à la page d'un jeu spécifique afin de voir la liste des challenges de ce jeu (en cours, populaires, tous).
En tant que visiteur, je veux accéder à la page d'un challenges spécifique afin de voir la liste des propositions des joueurs.

En tant qu' utilisateur, je veux pouvoir faire les mêmes choses qu'un visiteur.
En tant qu'utilisateur, je veux pouvoir me déconnecter.
En tant qu'utilisateur je veux popuvoir accéder à la page profil pour modifier mot de passe, modifier le pseudonyme.

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

## Table : `role`

| **Attribut** | **Type**      | **Description**                    | **Contraintes**        |
|--------------|---------------|------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique du rôle.        | SERIAL PRIMARY KEY         |
| name         | Text          | Nom du rôle.                       | NOT NULL UNIQUE       |

---

## Table : `user`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique de l'utilisateur.               | SERIAL PRIMARY KEY      |
| role_id      | Integer (FK)  | Référence vers l'identifiant du rôle.               | Doit exister dans `role` |
| name         | Text          | Nom de l'utilisateur.                              | NOT NULL              |
| password     | Text          | Mot de passe de l'utilisateur.                     | NOT NULL            |

---

## Table : `game`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique du jeu.                         | SERIAL PRIMARY KEY           |
| name         | Text          | Nom du jeu.                                        | NOT NULL             |
| date         | Integer       | Date de sortie du jeu (année).                     | NOT NULL             |
| platform     | Text          | Plateforme du jeu.                                 | NOT NULL               |
| picture      | Text          | URL de l'image associée au jeu.                   |       |

---

## Table : `challenge`

| **Attribut** | **Type**      | **Description**                                      | **Contraintes**        |
|--------------|---------------|----------------------------------------------------|------------------------|
| id           | Integer (PK)  | Identifiant unique du challenge.                   |SERIAL PRIMARY KEY          |
| user_id      | Integer (FK)  | Référence vers l'identifiant du créateur.          | Doit exister dans `user` |
| game_id      | Integer (FK)  | Référence vers l'identifiant du jeu.               | Doit exister dans `game` |
| name         | Text          | Nom du challenge.                                  | NOT NULL              |
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
