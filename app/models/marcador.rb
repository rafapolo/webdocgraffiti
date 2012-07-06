class Marcador < ActiveRecord::Base
	default_scope :order => 'created_at DESC'
	validates_presence_of :titulo, :lat, :long, :image_file_name
	has_and_belongs_to_many :tags
	belongs_to :bloco 
	
	has_attached_file :image,
	 :styles => {:thumb=> "173x"}
end
