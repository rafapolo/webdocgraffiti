class AddPositionToEnsaio < ActiveRecord::Migration
  def change
    add_column :ensaios, :position, :integer

  end
end
