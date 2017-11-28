class AddSenderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sender, :string
  end
end
