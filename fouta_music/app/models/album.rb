# app/models/album.rb
# ============================================================
# Modèle ActiveRecord pour les albums de l'application Fouta Music
# ============================================================
# Ce fichier définit la classe Ruby "Album" liée à la table SQL "albums".
# Chaque entrée de la table devient une instance de cette classe.
#
# Convention Rails obligatoire :
#   - Table SQL   → albums       (pluriel, snake_case)
#   - Fichier     → album.rb     (singulier, snake_case)
#   - Classe Ruby → Album        (singulier, CamelCase)
#
# Colonnes disponibles (définies dans la migration) :
#   - id         (integer)  → Clé primaire, auto-incrémentée par Rails
#   - title      (string)   → Titre de l'album
#   - artist     (string)   → Nom de l'artiste ou du groupe
#   - created_at (datetime) → Date de création de l'entrée (auto)
#   - updated_at (datetime) → Date de dernière modification (auto)
# ============================================================

class Album < ApplicationRecord
  # ApplicationRecord hérite d'ActiveRecord::Base, ce qui donne accès
  # à toutes les méthodes de manipulation de BDD.
  #
  # Rails associe automatiquement cette classe à la table "albums"
  # grâce à la convention de nommage pluriel/singulier.
  #
  # Exemples d'utilisation en console Rails :
  #   Album.count                             # → Nombre total d'albums en BDD
  #   Album.find_by(artist: 'AC/DC')          # → Premier album d'AC/DC
  #   Album.where(artist: 'Deep Purple')      # → Tous les albums de Deep Purple
  #   Album.where('title LIKE ?', '%Great%')  # → Albums contenant "Great"
  #   album = Album.find(1)
  #   album.title                             # → "For Those About To Rock..."
  #   album.artist                            # → "AC/DC"
  #   album.destroy                           # → Suppression de cet album en BDD
end
