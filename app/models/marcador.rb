class Marcador < ActiveRecord::Base
	validates_presence_of :titulo, :lat, :long
	has_many :tags
	
	has_attached_file :image,
	   :styles => {
	   :thumb=> "173x122!"
	   },
	 :storage => :s3,
	 :s3_credentials => "#{Rails.root}/config/s3.yml",
	 :path => "/:class/:style/:id/:filename"
end
