class Hiperbalon < ActiveRecord::Base
	belongs_to :bloco
	validates_presence_of :titulo, :in, :out, :bloco_id

	has_attached_file :image,
	   :styles => {
	   :thumb=> "x150"
	   },
	 :storage => :s3,
	 :s3_credentials => "#{Rails.root}/config/s3.yml",
	 :path => "/:class/:style/:id/:filename"
end
