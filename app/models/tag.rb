class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ensaios
  has_and_belongs_to_many :blocos
<<<<<<< HEAD
=======

  validates_presence_of :name
>>>>>>> c8c5b1115815bf373e07331566c176a09fcef29b
end
