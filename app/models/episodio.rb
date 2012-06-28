class Episodio < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

	has_attached_file :capa,
		:styles => {
	   		:thumb=> "200x"
	   	},
		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/s3.yml",
		:path => "/:class/:style/:id/:filename"

  has_many :blocos, :dependent => :destroy  
  
  validates_presence_of :titulo, :sinopse

  before_create :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end

	def self.ensaio?
		self.blocos.count > 4 ? self.blocos.last : nil
	end
end
