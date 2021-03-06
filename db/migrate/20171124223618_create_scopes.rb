class CreateScopes < ActiveRecord::Migration[5.1]
  def change
    create_table :scopes do |t|
      t.string :resource, null: false
      t.integer :resource_id, null: false
      t.references :role, foreign_key: true, null: false

      t.timestamps
    end

    add_index :scopes, [:resource, :resource_id, :role_id], unique: true
  end
end
