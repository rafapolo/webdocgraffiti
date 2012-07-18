class Tag < ActiveRecord::Base
  has_and_belongs_to_many :blocos
  has_and_belongs_to_many :marcadors
  validates_presence_of :name

  before_save :urlize
	def urlize
		self.urlized = self.name.urlize
	end

	def self.limpa
		Tag.all.each do |t|
			t.destroy if t.blocos.count==0 && t.marcadors.count==0
		end
	end
end
