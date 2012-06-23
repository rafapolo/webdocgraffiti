class Bloco < ActiveRecord::Base

	belongs_to :episodio
	has_many :georef
	has_and_belongs_to_many :tags

	has_attached_file :image,
	   :styles => {
	   :thumb=> "173x122!"
	   },
	 :storage => :s3,
	 :s3_credentials => "#{Rails.root}/config/s3.yml",
	 :path => "/:class/:style/:id/:filename"

	validates_format_of :video_url, :with => URI::regexp(%w(http https))
	validates_presence_of :info, :video_url, :titulo, :image_file_name
	validates_uniqueness_of :titulo

	before_create :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end

end





