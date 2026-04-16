# db/migrate/20240416000002_create_tracks.rb
# ============================================================
# Migration Rails — Création de la table "tracks"
# ============================================================
# Cette migration crée la table SQL qui stocke les pistes musicales
# (chansons) de l'application Fouta Music.
#
# IMPORTANT : Cette migration doit être passée APRÈS celle des albums
# (20240416000001_create_albums.rb) car les tracks référencent des albums.
# Rails les exécute dans l'ordre chronologique (basé sur le timestamp).
#
# Commandes utiles :
#   $ rails db:migrate          → Passe toutes les migrations en attente
#   $ rails db:rollback         → Annule la dernière migration (tracks d'abord)
#   $ rails db:migrate:status   → Affiche l'état de toutes les migrations
# ============================================================

class CreateTracks < ActiveRecord::Migration[7.0]
  # La méthode change() décrit les modifications à apporter à la BDD.
  # En cas de rollback, Rails supprimera automatiquement la table tracks.
  def change
    # Crée la table "tracks" dans la base de données SQLite3.
    # Chaque ligne représente une chanson avec toutes ses métadonnées.
    create_table :tracks do |t|

      # Colonne "title" : titre de la chanson, texte court
      # Ex: "Smoke on the Water", "White Room", "Layla"
      t.string :title

      # Colonne "album" : titre de l'album auquel appartient la chanson
      # Note : dans cette app simplifiée, on stocke le titre directement (string)
      # plutôt qu'une foreign key. Une app plus avancée utiliserait belongs_to :album
      t.string :album

      # Colonne "artist" : nom de l'artiste ou du groupe, texte court
      t.string :artist

      # Colonne "duration" : durée de la chanson en millisecondes (entier)
      # Ex: 343719 = 5 minutes et 43 secondes environ
      # Utiliser les ms permet une précision exacte sans virgule flottante
      t.integer :duration

      # Colonne "size" : taille du fichier audio en octets (entier)
      # Ex: 11170334 octets ≈ 10.6 Mo (fichier MP3 typique)
      t.integer :size

      # Colonne "price" : prix de vente de la chanson en dollars (décimal)
      # Type float pour permettre des valeurs comme 0.99 ou 1.29
      t.float :price

      # Ajoute automatiquement created_at et updated_at
      # Gérées automatiquement par Rails à chaque opération d'écriture
      t.timestamps
    end
  end
end
