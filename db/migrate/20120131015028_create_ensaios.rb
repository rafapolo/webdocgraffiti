class CreateEnsaios < ActiveRecord::Migration
  def change
    create_table :ensaios do |t|
      t.string :video_url
      t.string :titulo

      t.timestamps
    end
  end
end
