class Hiperbalon < ActiveRecord::Base
	belongs_to :bloco
	validates_presence_of :titulo, :in, :out, :bloco_id
end
