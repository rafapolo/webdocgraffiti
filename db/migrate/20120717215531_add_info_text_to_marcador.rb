class AddInfoTextToMarcador < ActiveRecord::Migration
  def change
    add_column :marcadors, :info, :text
  end
end
