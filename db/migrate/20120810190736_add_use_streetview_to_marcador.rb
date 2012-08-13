class AddUseStreetviewToMarcador < ActiveRecord::Migration
  def change
    add_column :marcadors, :use_streetview, :boolean

  end
end
