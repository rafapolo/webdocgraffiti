class AddPanoramaToMarcador < ActiveRecord::Migration
  def change
    add_column :marcadors, :heading, :string
    add_column :marcadors, :pitch, :string
    add_column :marcadors, :zoom, :integer
  end
end
