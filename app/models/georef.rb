class Georef < ActiveRecord::Base
  belongs_to :ensaio
  belongs_to :bloco
<<<<<<< HEAD
=======

  validates_presence_of :lat, :long
>>>>>>> c8c5b1115815bf373e07331566c176a09fcef29b
end
