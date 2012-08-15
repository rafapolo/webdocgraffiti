class Bloco < ActiveRecord::Base

	belongs_to :episodio
	has_many :marcadors, :dependent => :destroy
	has_many :hiperbalons, :dependent => :destroy 
	has_and_belongs_to_many :tags

	has_attached_file :image, :styles => {:thumb=> "173x122!", :full=> "900x"},
		:url => "/system/:class/:id/:style/:basename.:extension",
		:path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"

	validates_format_of :video_url, :with => URI::regexp(%w(http https))
	validates_presence_of :sinopse, :episodio_id, :video_url, :titulo, :image_file_name
	validates_uniqueness_of :titulo

	before_save :urlize
	def urlize
		self.urlized = self.titulo.urlize
	end

	after_create :notifica
	def notifica
		begin
			page = Koala::Facebook::GraphAPI.new(session[:token])
			path = "http://webdocgraffiti.com.br/#{self.episodio.urlized}/#{self.urlized}"		
			page.put_object('WebDocGraffiti', 'feed', :message => "Novo Video: #{self.titulo} > #{self.sinopse} > #{path}")
		rescue
		end
	end

	def self.next
		Episodio.first && Episodio.first.blocos && Episodio.first.blocos.first ? Episodio.first.blocos.first : false
	end

	def self.ensaio
		Episodio.first && Episodio.first.blocos.count == 5 ? Episodio.first.blocos.last : false
	end

	before_destroy :limpa_tags
	def limpa_tags
		Tag.limpa
	end

end