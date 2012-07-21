class Episodio < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

	has_attached_file :capa,
		:styles => {:thumb=> "200x"}

  has_many :blocos, :dependent => :destroy  
  
  validates_presence_of :titulo, :sinopse

  before_save :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end

	def ensaio?
		self.blocos.count > 4 ? self.blocos.last : nil
	end

	def position
		all = Episodio.all
		p = all.count
		all.each do |e|
			if e.id==self.id
				return p
			end
			p-=1
		end
	end
end
