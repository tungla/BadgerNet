class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :content
      t.timestamp :date

      t.timestamps
    end
  end
end
