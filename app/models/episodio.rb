class Episodio < ActiveRecord::Base
  has_many :blocos, :dependent => :destroy

  validates_presence_of :titulo, :sinopse
end
