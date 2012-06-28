class AddUrlizedStringToTags < ActiveRecord::Migration
  def change
    add_column :tags, :urlized, :string

  end
end
