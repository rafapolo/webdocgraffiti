class Episodio < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  has_many :blocos, :dependent => :destroy  
  
  validates_presence_of :titulo, :sinopse

  before_create :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end
end
