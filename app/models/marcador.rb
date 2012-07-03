class Marcador < ActiveRecord::Base
	validates_presence_of :titulo, :lat, :long, :image_file_name
	has_many :tags
	has_one :bloco 
	
	has_attached_file :image,
	 :styles => {:thumb=> "150x"}
end
