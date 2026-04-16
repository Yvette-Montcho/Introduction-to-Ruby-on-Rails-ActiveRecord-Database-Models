# db/migrate/20240416000001_create_movies.rb
# ============================================================
# Migration Rails — Création de la table "movies"
# ============================================================
# Cette migration crée la table SQL qui stocke les films de MYciné.
# Elle constitue la base de données de l'application.
#
# Statuts possibles :
#   - down : la table n'a pas encore été créée (état initial)
#   - up   : la table a été créée suite à "rails db:migrate"
#
# Commandes utiles :
#   $ rails db:migrate          → Passe cette migration de down à up
#   $ rails db:rollback         → Repasse cette migration de up à down
#   $ rails db:migrate:status   → Affiche l'état (up/down) de chaque migration
# ============================================================

class CreateMovies < ActiveRecord::Migration[7.0]
  # La méthode change() définit les actions à effectuer sur la BDD.
  # Rails sait automatiquement comment l'inverser (create_table → drop_table).
  def change
    # Crée une nouvelle table "movies" dans la base de données SQLite3.
    # Le bloc |t| permet de définir les colonnes de cette table.
    create_table :movies do |t|

      # Colonne "name" : titre du film, texte court (max 255 caractères)
      # Ex: "Beowulf", "Le Parrain", "Inception"
      t.string :name

      # Colonne "year" : année de sortie en salle, nombre entier
      # Ex: 2007, 1972, 2010
      t.integer :year

      # Colonne "genre" : catégorie cinématographique, texte court
      # Ex: "action", "horreur", "comédie", "drame"
      t.string :genre

      # Colonne "synopsis" : résumé long du film (utilise "text" pour les
      # contenus longs, contrairement à "string" limité à 255 caractères)
      t.text :synopsis

      # Colonne "director" : nom complet du réalisateur, texte court
      # Ex: "Christopher Nolan", "Robert Zemeckis"
      t.string :director

      # Colonne "mycine_rating" : note publique sur le site MYciné
      # Type float (décimal) pour permettre des notes comme 3.7 ou 4.2
      # Plage de valeurs : 0.0 à 5.0
      t.float :mycine_rating

      # Colonne "my_rating" : note personnelle de l'utilisateur
      # Type integer pour des valeurs entières (ex: 1 à 5 ou 1 à 10)
      # Peut être nil si l'utilisateur n'a pas encore noté le film
      t.integer :my_rating

      # Colonne "already_seen" : booléen indiquant si le film a été vu
      # true  → film déjà visionné
      # false → film à voir (valeur par défaut dans le seed)
      t.boolean :already_seen

      # Ajoute automatiquement deux colonnes de suivi temporel :
      #   - created_at (datetime) : date/heure de création de l'entrée
      #   - updated_at (datetime) : date/heure de dernière modification
      # Ces deux colonnes sont mises à jour automatiquement par Rails
      t.timestamps
    end
  end
end
