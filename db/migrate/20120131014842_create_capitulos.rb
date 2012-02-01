class CreateCapitulos < ActiveRecord::Migration
  def change
    create_table :capitulos do |t|
      t.string :video_url
      t.string :titulo
      t.string :info

      t.timestamps
    end
  end
end
