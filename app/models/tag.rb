class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ensaios
  has_and_belongs_to_many :blocos
end
