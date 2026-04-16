# Fouta Music — Application Rails de gestion musicale

Application Ruby on Rails créée dans le cadre de la formation **ETP4A** (Semaine 5, Jour 3).

Elle illustre la création de plusieurs modèles ActiveRecord liés à une base de données musicale réelle (Chinook Database).

---

## Modèles de données

### Table `albums` / Modèle `Album`

| Colonne     | Type     | Description                     |
|-------------|----------|---------------------------------|
| id          | integer  | Clé primaire (auto)             |
| title       | string   | Titre de l'album                |
| artist      | string   | Nom de l'artiste / du groupe    |
| created_at  | datetime | Date de création (auto)         |
| updated_at  | datetime | Date de mise à jour (auto)      |

### Table `tracks` / Modèle `Track`

| Colonne     | Type     | Description                            |
|-------------|----------|----------------------------------------|
| id          | integer  | Clé primaire (auto)                    |
| title       | string   | Titre de la chanson                    |
| album       | string   | Titre de l'album d'appartenance        |
| artist      | string   | Nom de l'artiste / du groupe           |
| duration    | integer  | Durée en millisecondes                 |
| size        | integer  | Taille du fichier en octets            |
| price       | float    | Prix de vente (en dollars)             |
| created_at  | datetime | Date de création (auto)                |
| updated_at  | datetime | Date de mise à jour (auto)             |

---

## Mise en place

```bash
# 1. Créer l'application Rails
rails new fouta_music
cd fouta_music

# 2. Copier les fichiers du projet dans les dossiers correspondants

# 3. Installer les dépendances
bundle install

# 4. Créer et migrer la base de données (2 migrations dans l'ordre)
rails db:migrate

# 5. Vérifier les migrations
rails db:migrate:status

# 6. Peupler la BDD avec les données Chinook
rails db:seed

# 7. Lancer la console Rails
rails console
```

---

## Réponses aux questions

### Niveau Facile

**1. Nombre total d'albums en BDD**
```ruby
Album.count
# => 347
```

**2. Auteur de la chanson "White Room"**
```ruby
Track.find_by(title: "White Room").artist
# => "Eric Clapton"
```

**3. Chanson durant exactement 188133 millisecondes**
```ruby
Track.find_by(duration: 188133).title
# => "Perfect"
# Artiste : Alanis Morissette, Album : Jagged Little Pill
```

**4. Groupe ayant sorti "Use Your Illusion II"**
```ruby
Album.find_by(title: "Use Your Illusion II").artist
# => "Guns N Roses"
```

---

### Niveau Moyen

**1. Nombre d'albums dont le titre contient "Great"**
```ruby
Album.where("title LIKE ?", "%Great%").count
# => 5
# (Great Opera Choruses, Great Recordings... x3, Great Performances...)
```

**2. Supprimer tous les albums dont le nom contient "music" (insensible à la casse)**
```ruby
# SQLite — insensible à la casse par défaut pour l'ASCII
Album.where("title LIKE ?", "%music%").destroy_all
# => Supprime les albums correspondants (vérifiez le count avant/après)
```

**3. Nombre d'albums écrits par AC/DC**
```ruby
Album.where(artist: "AC/DC").count
# => 2  ("For Those About To Rock..." et "Let There Be Rock")
```

**4. Nombre de chansons durant exactement 158589 millisecondes**
```ruby
Track.where(duration: 158589).count
# => 0  (aucune chanson ne dure exactement cette durée dans le dataset)
```

---

### Niveau Difficile

**1. Afficher tous les titres d'AC/DC**
```ruby
# Boucle sur tous les tracks AC/DC et affichage du titre
Track.where(artist: "AC/DC").each do |track|
  puts track.title
end
```

**2. Afficher tous les titres de l'album "Let There Be Rock"**
```ruby
Track.where(album: "Let There Be Rock").each do |track|
  puts track.title
end
```

**3. Prix total et durée totale de l'album "Let There Be Rock"**
```ruby
tracks = Track.where(album: "Let There Be Rock")

# Prix total (somme de tous les prix)
total_price = tracks.sum(:price)
puts "Prix total : #{total_price} $"
# => 7.92 $ (8 pistes × 0.99 $)

# Durée totale en millisecondes, converti en minutes
total_duration_ms = tracks.sum(:duration)
total_duration_min = (total_duration_ms / 1000.0 / 60).round(2)
puts "Durée totale : #{total_duration_ms} ms (#{total_duration_min} minutes)"
```

**4. Coût total de la discographie de Deep Purple**
```ruby
# Trouver tous les tracks de Deep Purple
deep_purple_tracks = Track.where(artist: "Deep Purple")

# Calculer le coût total
total_cost = deep_purple_tracks.sum(:price)
puts "Coût intégralité discographie Deep Purple : #{total_cost.round(2)} $"
puts "Nombre de pistes : #{deep_purple_tracks.count}"
```

**5. Modifier tous les titres d'Eric Clapton pour afficher "Britney Spears" en artist**
```ruby
# Récupérer tous les tracks d'Eric Clapton et les mettre à jour
Track.where(artist: "Eric Clapton").each do |track|
  track.update(artist: "Britney Spears")
end

# Vérification : tous les tracks doivent maintenant avoir Britney Spears
Track.where(artist: "Britney Spears").count
```

---

## Commandes de migration utiles

```bash
rails db:migrate           # Passe toutes les migrations en attente
rails db:migrate:status    # Affiche l'état de chaque migration
rails db:rollback          # Annule la dernière migration
rails db:rollback STEP=2   # Annule les 2 dernières migrations
rails db:seed              # Exécute le fichier db/seeds.rb
```
