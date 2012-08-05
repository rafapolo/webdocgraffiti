class AddPositionToEpisodio < ActiveRecord::Migration
  def change
    add_column :episodios, :position, :integer

  end
end
