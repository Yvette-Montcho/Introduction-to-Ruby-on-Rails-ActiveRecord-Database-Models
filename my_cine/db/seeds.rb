# db/seeds.rb
# ============================================================
# Fichier de seed de l'application MYciné
# ============================================================
# Ce fichier peuple automatiquement la base de données avec des
# films générés aléatoirement grâce à la gem Faker.
#
# PRÉREQUIS :
#   Ajouter dans le Gemfile (groupe :development, :test) :
#     gem 'faker'
#   Puis exécuter : $ bundle install
#
# EXÉCUTION :
#   $ rails db:seed
#
# RÉINITIALISATION COMPLÈTE (recommandée avant chaque seed) :
#   $ rails db:seed        # efface tout puis recrée (destroy_all inclus)
# ============================================================

# Chargement de la gem Faker pour générer des données réalistes et aléatoires
require 'faker'

# ----------------------------------------------------------
# NETTOYAGE : suppression de tous les films existants
# ----------------------------------------------------------
# Évite la duplication lors de multiples exécutions du seed.
# ATTENTION : cette opération est irréversible sur les données existantes !
Movie.destroy_all
puts "==> Anciens films supprimés de la base de données."

# ----------------------------------------------------------
# DÉFINITION DES GENRES DISPONIBLES
# ----------------------------------------------------------
# Tableau des genres autorisés pour les films générés.
# La méthode .sample choisira l'un d'eux aléatoirement à chaque iteration.
genres = ["action", "horreur", "comédie", "drame"]

# ----------------------------------------------------------
# CRÉATION DE 100 FILMS AVEC FAKER
# ----------------------------------------------------------
# Boucle pour créer 100 entrées dans la table movies.
# Chaque film possède des attributs réalistes et variés.
100.times do
  # Movie.create! lève une exception si la création échoue
  # (contrairement à Movie.create qui retourne false silencieusement)
  Movie.create!(
    # Titre du film généré aléatoirement par Faker::Movie
    # Ex: "The Godfather", "Pulp Fiction", "Star Wars"
    name: Faker::Movie.title,

    # Année de sortie aléatoire entre 1900 et 2020
    # rand(range) retourne un entier dans la plage donnée
    year: rand(1900..2020),

    # Genre choisi aléatoirement dans le tableau des genres disponibles
    # .sample retourne un élément aléatoire d'un tableau
    genre: genres.sample,

    # Synopsis composé de 3 phrases aléatoires (minimum 10 mots garantis)
    # sentence_count: 3 génère un paragraphe de 3 phrases
    synopsis: Faker::Lorem.paragraph(sentence_count: 3),

    # Nom de réalisateur plausible généré par Faker::Name
    # Ex: "John Smith", "Marie Dupont"
    director: Faker::Name.name,

    # Note MYciné aléatoire entre 0.0 et 5.0 avec exactement 1 décimale
    # Explication : rand retourne un float entre 0 et 1
    #   * 50 donne un float entre 0 et 50
    #   .round arrondit à l'entier le plus proche (0 à 50)
    #   / 10.0 redivise pour obtenir un float entre 0.0 et 5.0
    mycine_rating: (rand * 50).round / 10.0,

    # Film non encore visionné par défaut (valeur booléenne false)
    already_seen: false,

    # Note personnelle non définie car le film n'a pas été vu
    # nil en Ruby représente l'absence de valeur (équivalent à NULL en SQL)
    my_rating: nil
  )
end

# Message de confirmation affiché dans le terminal après le seed réussi
puts "==> 100 films créés avec succès dans la base de données MYciné !"
puts "==> Lancez 'rails console' puis tapez 'Movie.count' pour vérifier."
