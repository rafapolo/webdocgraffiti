class Episodio < ActiveRecord::Base
  has_many :blocos
  has_one :ensaio
<<<<<<< HEAD
=======

  validates_presence_of :titulo, :resumo, :sinopse
>>>>>>> c8c5b1115815bf373e07331566c176a09fcef29b
end
