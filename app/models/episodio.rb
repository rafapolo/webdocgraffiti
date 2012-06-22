class Episodio < ActiveRecord::Base
  has_many :blocos, :dependent => :destroy

  validates_presence_of :titulo, :sinopse

  before_create :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end
end
