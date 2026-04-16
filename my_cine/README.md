# MYciné — Application Rails de gestion de films

Application Ruby on Rails créée dans le cadre de la formation **ETP4A** (Semaine 5, Jour 3).

Elle illustre la création d'un modèle ActiveRecord, les migrations Rails et la manipulation de données via la console Rails et les seeds.

---

## Modèle de données

### Table `movies` / Modèle `Movie`

| Colonne        | Type    | Description                              |
|----------------|---------|------------------------------------------|
| id             | integer | Clé primaire (auto)                      |
| name           | string  | Titre du film                            |
| year           | integer | Année de sortie                          |
| genre          | string  | Genre (action, horreur, comédie, drame)  |
| synopsis       | text    | Résumé du film                           |
| director       | string  | Nom du réalisateur                       |
| mycine_rating  | float   | Note publique (0.0 à 5.0)                |
| my_rating      | integer | Note personnelle                         |
| already_seen   | boolean | Film déjà visionné ?                     |
| created_at     | datetime| Date de création (auto)                  |
| updated_at     | datetime| Date de mise à jour (auto)               |

---

## Mise en place

```bash
# 1. Créer l'application Rails (si pas encore fait)
rails new my_cine
cd my_cine

# 2. Copier les fichiers du projet dans les dossiers correspondants
#    (model, migration, seeds, Gemfile)

# 3. Installer les dépendances
bundle install

# 4. Créer et migrer la base de données
rails db:migrate

# 5. Vérifier le statut des migrations
rails db:migrate:status

# 6. Peupler la BDD avec 100 films fictifs
rails db:seed

# 7. Lancer la console Rails pour tester
rails console
```

---

## Commandes utiles en console Rails

```ruby
# Compter les films
Movie.count

# Voir tous les films
Movie.all

# Trouver par id
Movie.find(1)

# Chercher par attribut
Movie.find_by(genre: "action")

# Filtrer avec where
Movie.where(already_seen: true)
Movie.where(genre: "drame").order(year: :desc)

# Créer un film
Movie.create(
  name: "Inception",
  year: 2010,
  genre: "action",
  director: "Christopher Nolan",
  mycine_rating: 4.7,
  already_seen: true,
  my_rating: 5
)

# Modifier un film
film = Movie.find(1)
film.update(mycine_rating: 4.7)

# Supprimer un film
film = Movie.find(1)
film.destroy

# Afficher en tableau (gem table_print)
tp Movie.all, :name, :year, :genre, :mycine_rating

# Créer 100 films avec boucle (exemple console)
100.times do |i|
  Movie.create(name: "Film #{i}", year: rand(1990..2023), genre: "action", already_seen: false)
end
```

---

## Réponses aux exercices console

### Exercice a) — Beowulf
```ruby
film1 = Movie.new
film1.name = "Beowulf"
film1.year = 2007
film1.genre = "action"
film1.synopsis = "Le héros Beowulf affronte le monstre Grendel..."
film1.director = "Robert Zemeckis"
film1.mycine_rating = 3.2
film1.already_seen = false
film1.save
```

### Exercice c) — Freestyle

```ruby
# Modifier la note MYciné de Beowulf à 4.7
beowulf = Movie.find_by(name: "Beowulf")
beowulf.update(mycine_rating: 4.7)

# Modifier le genre de l'Exorciste
exorciste = Movie.find_by(name: "L'Exorciste")
exorciste.update(genre: "comédie")

# Afficher tous les films déjà vus
Movie.where(already_seen: true)

# Supprimer le premier film déjà vu
Movie.where(already_seen: true).first.destroy
```
