class AddStartEndTimeToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start, :time
    add_column :events, :end, :time
  end
end
