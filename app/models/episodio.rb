class Episodio < ActiveRecord::Base
  has_many :blocos
  has_one :ensaio
end
