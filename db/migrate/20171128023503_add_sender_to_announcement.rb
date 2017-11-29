class AddSenderToAnnouncement < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :sender, :string
  end
end
