class Movie < ApplicationRecord
  # Validações
  validates :title, presence: true
  validates :rating, inclusion: { in: ->(movie) { movie.class.all_ratings } }
  validates :release_date, presence: true
  
  # Todas as classificações
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R', 'NC-17']
  end
end