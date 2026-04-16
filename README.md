# ETP4A - Initiation à Ruby on Rails : ActiveRecord & Modèles de BDD

**Thème :** Passage de SQL à ActiveRecord - Migrations, Modèles et Console Rails

---

## Nom du dépôt GitHub recommandé

```
etp4a-rails-activerecord
```

---

## Description du projet

Ce dépôt contient deux applications Ruby on Rails indépendantes développées pour maîtriser les fondamentaux du **backend Rails** :

| Application | Description | Modèles |
|-------------|-------------|---------|
| `my_cine/` | Catalogue de films personnel (style Allociné) | `Movie` |
| `fouta_music/` | Bibliothèque musicale (base Chinook) | `Album`, `Track` |

Les deux applications illustrent :
- La création d'applications Rails avec `rails new`
- La mise en place de **migrations** pour structurer la base de données
- La définition de **modèles ActiveRecord** en Ruby
- La manipulation de données via la **console Rails** (CRUD complet)
- L'utilisation des **seeds** pour peupler la BDD automatiquement
- L'usage de la gem **Faker** pour générer des données fictives réalistes

---

## Structure du projet

```
etp4a-rails-activerecord/
├── README.md                    ← Ce fichier
│
├── my_cine/                     ← Application MYciné
│   ├── Gemfile                  ← Dépendances Ruby
│   ├── README.md                ← Docs + réponses exercices
│   ├── app/
│   │   └── models/
│   │       └── movie.rb         ← Modèle ActiveRecord Movie
│   └── db/
│       ├── migrate/
│       │   └── 20240416000001_create_movies.rb  ← Migration table movies
│       └── seeds.rb             ← Seed avec 100 films (Faker)
│
└── fouta_music/                 ← Application Fouta Music
    ├── Gemfile                  ← Dépendances Ruby
    ├── README.md                ← Docs + réponses exercices
    ├── app/
    │   └── models/
    │       ├── album.rb         ← Modèle ActiveRecord Album
    │       └── track.rb         ← Modèle ActiveRecord Track
    └── db/
        ├── migrate/
        │   ├── 20240416000001_create_albums.rb  ← Migration table albums
        │   └── 20240416000002_create_tracks.rb  ← Migration table tracks
        └── seeds.rb             ← Seed avec données musicales Chinook
```

---

## Prérequis

Vérifiez les versions installées sur votre machine :

```bash
ruby -v     # >= 3.0.0
rails -v    # >= 7.0.0
bundle -v   # Bundler doit être installé
sqlite3 --version
```

---

## Configuration de VS Code

### Extensions recommandées

Installez ces extensions avant de commencer à coder :

| Extension | Identifiant VS Code Marketplace | Utilité |
|-----------|--------------------------------|---------|
| **Ruby LSP** | `Shopify.ruby-lsp` | Autocomplétion, navigation, analyse statique Ruby |
| **VSCode Ruby** | `wingrunr21.vscode-ruby` | Coloration syntaxique et snippets Ruby |
| **Rails** | `bung87.rails` | Support fichiers Rails (routes, vues, helpers) |
| **SQLite Viewer** | `qwtel.sqlite-viewer` | Visualiser le fichier `development.sqlite3` directement dans VS Code |
| **GitLens** | `eamodio.gitlens` | Historique Git avancé, blame inline, comparaison de branches |
| **Error Lens** | `usernamehw.errorlens` | Affichage des erreurs et warnings directement dans le code |
| **Better Comments** | `aaron-bond.better-comments` | Commentaires colorés (TODO, FIXME, ALERTE...) |
| **Endwise** | `kaiwood.endwise` | Auto-complétion des blocs `end` en Ruby |
| **Prettier** | `esbenp.prettier-vscode` | Formatage automatique du code |

### Installation rapide des extensions (terminal VS Code)

```bash
code --install-extension Shopify.ruby-lsp
code --install-extension wingrunr21.vscode-ruby
code --install-extension bung87.rails
code --install-extension qwtel.sqlite-viewer
code --install-extension eamodio.gitlens
code --install-extension usernamehw.errorlens
code --install-extension aaron-bond.better-comments
code --install-extension kaiwood.endwise
```

### Configuration VS Code recommandée (`.vscode/settings.json`)

Créez ce fichier à la racine du projet pour une expérience optimale :

```json
{
  "[ruby]": {
    "editor.defaultFormatter": "Shopify.ruby-lsp",
    "editor.formatOnSave": true,
    "editor.tabSize": 2
  },
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "files.trimTrailingWhitespace": true,
  "editor.rulers": [120]
}
```

---

## Lancement de l'application MYciné

```bash
# Étape 1 - Créer l'application Rails
rails new my_cine
cd my_cine

# Étape 2 - Remplacer le Gemfile par celui du projet, puis :
bundle install

# Étape 3 - Copier les fichiers dans les bons dossiers :
#   app/models/movie.rb
#   db/migrate/20240416000001_create_movies.rb
#   db/seeds.rb

# Étape 4 - Créer et migrer la base de données
rails db:migrate

# Étape 5 - Vérifier la migration
rails db:migrate:status
# Doit afficher :  up  20240416000001  Create movies

# Étape 6 - Peupler la BDD avec 100 films générés par Faker
rails db:seed

# Étape 7 - Ouvrir la console Rails pour tester
rails console
# Dans la console :
#   Movie.count       # => 100
#   Movie.first       # => Premier film créé
#   Movie.all         # => Tous les films
```

---

## Lancement de l'application Fouta Music

```bash
# Étape 1 - Créer l'application Rails
rails new fouta_music
cd fouta_music

# Étape 2 - Remplacer le Gemfile, puis :
bundle install

# Étape 3 - Copier les fichiers dans les bons dossiers :
#   app/models/album.rb
#   app/models/track.rb
#   db/migrate/20240416000001_create_albums.rb
#   db/migrate/20240416000002_create_tracks.rb
#   db/seeds.rb

# Étape 4 - Migrer les deux tables
rails db:migrate
# Les migrations s'exécutent dans l'ordre chronologique (albums avant tracks)

# Étape 5 - Insérer les données Chinook (peut prendre quelques secondes)
rails db:seed

# Étape 6 - Vérifier en console
rails console
#   Album.count    # => 347
#   Track.count    # => nombre de pistes insérées
```

---

## Commandes Rails essentielles

```bash
# Migrations
rails generate migration NomMigration   # Crée un fichier de migration
rails db:migrate                         # Exécute toutes les migrations en attente
rails db:migrate:status                  # Affiche l'état de chaque migration
rails db:rollback                        # Annule la dernière migration
rails db:rollback STEP=2                 # Annule les 2 dernières migrations

# Console
rails console                            # Lance la console Rails (branchée à la BDD)
rails console --sandbox                  # Console en mode sandbox (aucune modif sauvée)
rails c                                  # Raccourci de rails console

# Base de données
rails db:seed                            # Exécute db/seeds.rb
rails db:reset                           # Efface et recrée la BDD (migrate + seed)

# Génération de code
rails generate model NomModel            # Génère un modèle + sa migration
rails generate migration NomMigration    # Génère une migration seule
```

---

## Ressources utiles

- [Rails Guides (documentation officielle)](https://guides.rubyonrails.org)
- [ActiveRecord Query Interface](https://guides.rubyonrails.org/active_record_querying.html)
- [ActiveRecord Migrations](https://guides.rubyonrails.org/active_record_migrations.html)
- [Faker gem (GitHub)](https://github.com/faker-ruby/faker)
- [Table Print gem (GitHub)](https://github.com/arches/table_print)
