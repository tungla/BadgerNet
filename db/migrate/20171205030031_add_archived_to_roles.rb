class AddArchivedToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :archived, :boolean, default: false
  end
end
