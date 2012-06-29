class ChangeHiperBalon < ActiveRecord::Migration
  def up
  	add_column :hiperbalons, :image_file_name, :string
  end

  def down
  end
end
