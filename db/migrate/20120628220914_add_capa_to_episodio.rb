class AddCapaToEpisodio < ActiveRecord::Migration
  def change
   
    add_column :episodios, :capa_file_name, :string
    add_column :episodios, :capa_content_type, :string
    add_column :episodios, :capa_file_size, :string
    add_column :episodios, :capa_updated_at, :strin
  end
end
