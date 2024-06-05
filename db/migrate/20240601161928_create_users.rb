class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :authority, null: false
      t.index :name, unique: true

      t.timestamps
    end
  end
end
