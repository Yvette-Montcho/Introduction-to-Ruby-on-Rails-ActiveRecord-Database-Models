# db/migrate/20240416000001_create_albums.rb
# ============================================================
# Migration Rails — Création de la table "albums"
# ============================================================
# Cette migration crée la table SQL qui stocke les albums musicaux
# de l'application Fouta Music.
#
# Commandes utiles :
#   $ rails db:migrate          → Passe cette migration de down à up
#   $ rails db:rollback         → Repasse cette migration de up à down
#   $ rails db:migrate:status   → Affiche l'état de toutes les migrations
# ============================================================

class CreateAlbums < ActiveRecord::Migration[7.0]
  # La méthode change() décrit la modification à apporter à la BDD.
  # Rails est capable d'annuler automatiquement un create_table (rollback = drop_table).
  def change
    # Crée la table "albums" dans la base de données SQLite3.
    # Rails ajoute automatiquement une colonne "id" (clé primaire) sans qu'on le demande.
    create_table :albums do |t|

      # Colonne "title" : titre de l'album, texte court
      # Ex: "For Those About To Rock We Salute You", "Back to Black"
      t.string :title

      # Colonne "artist" : nom de l'artiste ou du groupe, texte court
      # Ex: "AC/DC", "Amy Winehouse", "Deep Purple"
      t.string :artist

      # Ajoute automatiquement created_at et updated_at
      # Ces colonnes sont gérées automatiquement par Rails à chaque save/create/update
      t.timestamps
    end
  end
end
