class ChangeTagNameToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column :tags, :name, :string, null: false
  end
end
