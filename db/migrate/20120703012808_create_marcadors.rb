class CreateMarcadors < ActiveRecord::Migration
  def change
    create_table :marcadors do |t|
      t.string :lat
      t.string :long
      t.string :titulo

      t.timestamps
    end
  end
end
