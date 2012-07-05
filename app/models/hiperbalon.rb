class Hiperbalon < ActiveRecord::Base
	belongs_to :bloco
	belongs_to :marcador
	validates_presence_of :in, :out, :bloco_id, :url, :image_file_name

	has_attached_file :image,
	  :styles => {:thumb=> "x150"}
end
