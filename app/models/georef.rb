class Georef < ActiveRecord::Base
  belongs_to :ensaio
  belongs_to :bloco
  validates_presence_of :lat, :long

end
