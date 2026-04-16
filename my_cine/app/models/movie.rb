# app/models/movie.rb
# ============================================================
# Modèle ActiveRecord pour les films de l'application MYciné
# ============================================================
# Ce fichier définit la classe Ruby "Movie" qui est intimement liée
# à la table SQL "movies" de la base de données.
# Grâce à ActiveRecord, chaque ligne de la table devient une instance Ruby.
#
# Convention Rails obligatoire :
#   - Table SQL   → movies       (pluriel, snake_case)
#   - Fichier     → movie.rb     (singulier, snake_case)
#   - Classe Ruby → Movie        (singulier, CamelCase)
#
# Colonnes disponibles (définies dans la migration) :
#   - id            (integer)  → Clé primaire, auto-incrémentée par Rails
#   - name          (string)   → Titre du film
#   - year          (integer)  → Année de sortie
#   - genre         (string)   → Type de film (action, horreur, comédie, drame...)
#   - synopsis      (text)     → Résumé long du film
#   - director      (string)   → Nom du réalisateur
#   - mycine_rating (float)    → Note spectateurs (0.0 à 5.0, ex: 3.7)
#   - my_rating     (integer)  → Note personnelle de l'utilisateur
#   - already_seen  (boolean)  → true si le film a été visionné, false sinon
#   - created_at    (datetime) → Date de création de l'entrée (auto)
#   - updated_at    (datetime) → Date de dernière modification (auto)
# ============================================================

class Movie < ApplicationRecord
  # ApplicationRecord hérite lui-même d'ActiveRecord::Base.
  # C'est ce lien qui donne accès à toutes les méthodes ActiveRecord :
  # .all, .find, .find_by, .where, .create, .save, .update, .destroy, etc.
  #
  # Rails associe automatiquement cette classe à la table "movies"
  # grâce à la convention de nommage (pas besoin de le déclarer).
  #
  # Exemple d'utilisation en console Rails :
  #   film = Movie.new(name: "Inception", year: 2010, genre: "action")
  #   film.save                        # → INSERT INTO movies ...
  #   Movie.all                        # → SELECT * FROM movies
  #   Movie.find(1)                    # → SELECT * FROM movies WHERE id = 1
  #   Movie.where(genre: "action")     # → SELECT * FROM movies WHERE genre = 'action'
  #   film.update(mycine_rating: 4.5)  # → UPDATE movies SET mycine_rating = ...
  #   film.destroy                     # → DELETE FROM movies WHERE id = ...
end
