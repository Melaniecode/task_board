class AddIndexToTags < ActiveRecord::Migration[7.1]
  def change
    add_index :tags, :name, unique: true, name: "index_tags_on_name"
  end
end
