class Georef < ActiveRecord::Base
  belongs_to :ensaio
  belongs_to :bloco
end
