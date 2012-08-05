class Episodio < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  has_attached_file :capa, :styles => {:thumb=> "200x"}
  has_many :blocos, :dependent => :destroy  
  
  validates_presence_of :titulo, :sinopse

	before_save :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end

	before_create :indexa
	def indexa
		self.position = Episodio.count+1	
	end

	def ensaio?
		self.blocos.count > 4 ? self.blocos.last : nil
	end

end
