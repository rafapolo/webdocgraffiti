class AddImageToMarcadors < ActiveRecord::Migration
  def change
	add_column :marcadors, :publico, :bool
  	add_column :marcadors, :image_file_name, :string
    add_column :marcadors, :image_content_type, :string
    add_column :marcadors, :image_file_size, :string
    add_column :marcadors, :image_updated_at, :string
  end
end
