class ChangeTagNameToNotNull < ActiveRecord::Migration[7.1]
  def up
    change_column :tags, :name, :string, null: false
  end

  def down
    change_column :tags, :name, :string, null: true
  end
end
