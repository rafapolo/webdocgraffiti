class CreateGeorefs < ActiveRecord::Migration
  def change
    create_table :georefs do |t|
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
