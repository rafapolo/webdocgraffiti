class AddBlocoIdToMarcadors < ActiveRecord::Migration
  def change
    add_column :marcadors, :bloco_id, :integer
  end
end
