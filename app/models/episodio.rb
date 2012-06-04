class Episodio < ActiveRecord::Base
  has_many :blocos
  has_one :ensaio

  validates_presence_of :titulo, :sinopse
end
