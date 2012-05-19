class Ensaio < ActiveRecord::Base
  belongs_to :episodio
  has_many :georef
  has_and_belongs_to_many :tags

  validates_format_of :video_url, :with => URI::regexp(%w(http https))
  validates_presence_of :video_url, :titulo
end
