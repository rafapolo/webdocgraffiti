class Marcador < ActiveRecord::Base
	validates_presence_of :titulo, :lat, :long, :image_file_name
	has_many :tags
	
	has_attached_file :image,
	   :styles => {
	   :thumb=> "150x"
	   },
	 :storage => :s3,
	 :s3_credentials => "#{Rails.root}/config/s3.yml",
	 :path => "/:class/:style/:id/:filename"
end
