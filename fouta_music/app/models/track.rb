# app/models/track.rb
# ============================================================
# Modèle ActiveRecord pour les pistes musicales de Fouta Music
# ============================================================
# Ce fichier définit la classe Ruby "Track" liée à la table SQL "tracks".
# Chaque ligne de la table représente une chanson (piste audio).
#
# Convention Rails obligatoire :
#   - Table SQL   → tracks      (pluriel, snake_case)
#   - Fichier     → track.rb    (singulier, snake_case)
#   - Classe Ruby → Track       (singulier, CamelCase)
#
# Colonnes disponibles (définies dans la migration) :
#   - id         (integer)  → Clé primaire, auto-incrémentée par Rails
#   - title      (string)   → Titre de la chanson
#   - album      (string)   → Titre de l'album auquel appartient la chanson
#   - artist     (string)   → Nom de l'artiste ou du groupe
#   - duration   (integer)  → Durée de la chanson en millisecondes
#   - size       (integer)  → Taille du fichier audio en octets
#   - price      (float)    → Prix de vente de la chanson (en dollars)
#   - created_at (datetime) → Date de création de l'entrée (auto)
#   - updated_at (datetime) → Date de dernière modification (auto)
# ============================================================

class Track < ApplicationRecord
  # ApplicationRecord hérite d'ActiveRecord::Base, donnant accès
  # à toutes les méthodes de manipulation de BDD.
  #
  # Rails associe automatiquement cette classe à la table "tracks"
  # grâce à la convention de nommage pluriel/singulier.
  #
  # Exemples d'utilisation en console Rails :
  #   Track.count                               # → Nombre total de pistes
  #   Track.find_by(title: 'White Room')        # → La chanson "White Room"
  #   Track.where(artist: 'AC/DC')              # → Toutes les chansons d'AC/DC
  #   Track.where(duration: 188133)             # → Piste durant exactement 188133ms
  #
  # Exemple de calcul de prix total d'un album en console :
  #   tracks = Track.where(album: 'Let There Be Rock')
  #   total_price = tracks.sum(:price)          # → Prix total de l'album
  #   total_duration = tracks.sum(:duration)    # → Durée totale en ms
end
