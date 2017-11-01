class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.string :file_path, null: false

      t.timestamps
    end
    add_index :documents, :title, unique: true
    add_index :documents, :file_path, unique: true
  end
end
