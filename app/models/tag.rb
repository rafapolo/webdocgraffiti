class Tag < ActiveRecord::Base
  has_and_belongs_to_many :blocos
  has_and_belongs_to_many :marcadors
  validates_presence_of :name

  before_save :urlize
	def urlize
		self.urlized = self.name.urlize
	end
end
