class Ensaio < ActiveRecord::Base
  belongs_to :episodio
  has_many :georef
  has_and_belongs_to_many :tags
end
