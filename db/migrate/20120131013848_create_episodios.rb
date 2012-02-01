class CreateEpisodios < ActiveRecord::Migration
  def change
    create_table :episodios do |t|
      t.string :resumo
      t.string :sinopse
      t.string :titulo

      t.timestamps
    end
  end
end
