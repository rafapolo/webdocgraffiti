class CreateHiperbalons < ActiveRecord::Migration
  def change
    create_table :hiperbalons do |t|
      t.integer :bloco_id
      t.integer :in
      t.integer :out
      t.string :titulo
      t.string :url
      t.string :image_name
      t.string :image_type
      t.integer :image_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
