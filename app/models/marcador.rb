class Marcador < ActiveRecord::Base
	default_scope :order => 'created_at DESC'
	validates_presence_of :titulo, :info, :lat, :long
	validates_presence_of :image_file_name, :if => Proc.new { |m| !m.bloco_id? }
	has_and_belongs_to_many :tags
	belongs_to :bloco
	
	has_attached_file :image, :styles => {:thumb=> "170x", :full=> "900x"},
		:url => "/system/:class/:id/:style/:basename.:extension",
		:path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"

	before_save :limpa_tags
	def limpa_tags
		Tag.limpa
	end

end
