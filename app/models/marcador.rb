class Marcador < ActiveRecord::Base
	validates_presence_of :titulo, :lat, :long, :image_file_name
	has_and_belongs_to_many :tags
	belongs_to :bloco 
	
	has_attached_file :image,
	 :styles => {:thumb=> "150x"}
end
